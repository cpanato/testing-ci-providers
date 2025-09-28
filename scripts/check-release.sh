#!/usr/bin/env bash

set -uo pipefail

# Default values
REPO_OWNER=""
REPO_NAME=""
DAYS_THRESHOLD=7

# Function to show usage
usage() {
    echo "Usage: $0 -o OWNER -r REPO [-d DAYS]"
    echo "  -o OWNER: GitHub repository owner"
    echo "  -r REPO:  GitHub repository name"
    echo "  -d DAYS:  Days threshold (default: 7)"
    echo ""
    echo "Example: $0 -o chainguard-dev -r mono -d 7"
    exit 1
}

# Parse command line arguments
while getopts "o:r:d:h" opt; do
    case ${opt} in
        o)
            REPO_OWNER="${OPTARG}"
            ;;
        r)
            REPO_NAME="${OPTARG}"
            ;;
        d)
            DAYS_THRESHOLD="${OPTARG}"
            ;;
        h)
            usage
            ;;
        \?)
            echo "Invalid option: -${OPTARG}" >&2
            usage
            ;;
        *)
            echo "Unexpected option: -${OPTARG}" >&2
            usage
            ;;
    esac
done

# Check required parameters
if [[ -z "${REPO_OWNER}" || -z "${REPO_NAME}" ]]; then
    echo "Error: Repository owner and name are required" >&2
    usage
fi

# Function to get the latest release date
get_latest_release() {
    # Use gh CLI to get the latest release info
    local published_at
    if published_at=$(gh release view --repo "${REPO_OWNER}/${REPO_NAME}" --json publishedAt --jq '.publishedAt' 2>/dev/null); then
        # Check if the result is valid
        if [[ -z "${published_at}" || "${published_at}" == "null" ]]; then
            echo "WARN: No published date found for the latest release"
            return 1
        fi
        echo "${published_at}"
    else
        # Command failed, try to check if the repo exists and has any releases at all
        local release_count
        if release_count=$(gh release list --repo "${REPO_OWNER}/${REPO_NAME}" --limit 1 2>/dev/null | wc -l); then
            if [[ ${release_count} -eq 0 ]]; then
                echo "WARN: No releases found for repository ${REPO_OWNER}/${REPO_NAME}"
                return 1
            else
                echo "WARN: No published date found for the latest release"
                return 1
            fi
        else
            echo "ERROR: Unable to access repository ${REPO_OWNER}/${REPO_NAME}. Check if it exists and you have access." >&2
            return 1
        fi
    fi
}

# Function to calculate days difference
days_since_release() {
    local release_date="$1"

    # Parse ISO 8601 date manually (e.g., 2025-09-24T14:18:03Z)
    # Extract date part (YYYY-MM-DD)
    local date_part="${release_date%%T*}"

    # Extract components
    local year="${date_part%%-*}"
    local month_day="${date_part#*-}"
    local month="${month_day%%-*}"
    local day="${month_day#*-}"

    # Convert to epoch seconds using a reference date approach
    # We'll calculate days since epoch (1970-01-01) for both dates

    # Calculate days since epoch for the release date
    local release_days
    release_days=$(calculate_days_since_epoch "${year}" "${month}" "${day}")

    # Calculate days since epoch for today
    local current_year current_month current_day
    current_year=$(date +%Y)
    current_month=$(date +%m)
    current_day=$(date +%d)

    local current_days
    current_days=$(calculate_days_since_epoch "${current_year}" "${current_month}" "${current_day}")

    # Calculate difference
    local diff_days=$((current_days - release_days))

    echo "${diff_days}"
}

# Helper function to calculate days since epoch (1970-01-01)
calculate_days_since_epoch() {
    local year=$1
    local month=$2
    local day=$3

    # Remove leading zeros to avoid octal interpretation
    year=$((10#${year}))
    month=$((10#${month}))
    day=$((10#${day}))

    # Calculate total days
    local total_days=0

    # Add days for complete years since 1970
    local y
    for ((y = 1970; y < year; y++)); do
        if is_leap_year "$y"; then
            total_days=$((total_days + 366))
        else
            total_days=$((total_days + 365))
        fi
    done

    # Days in each month (non-leap year)
    local days_in_month=(31 28 31 30 31 30 31 31 30 31 30 31)

    # Add days for complete months in the target year
    local m
    for ((m = 1; m < month; m++)); do
        if [[ ${m} -eq 2 ]] && is_leap_year "${year}"; then
            total_days=$((total_days + 29))
        else
            total_days=$((total_days + ${days_in_month[$((m-1))]}))
        fi
    done

    # Add remaining days
    total_days=$((total_days + day - 1))

    echo "${total_days}"
}

# Helper function to check if a year is a leap year
is_leap_year() {
    local year=$1
    if (( year % 400 == 0 )) || (( year % 4 == 0 && year % 100 != 0 )); then
        return 0  # true
    else
        return 1  # false
    fi
}

# Main logic
main() {
    echo "Checking latest release for ${REPO_OWNER}/${REPO_NAME}..."

    # Get latest release date
    local release_date
    release_date=$(get_latest_release)
    local get_release_exit_code=$?

    if [[ ${get_release_exit_code} -ne 0 ]]; then
        echo "ALERT: Unable to retrieve release information for ${REPO_OWNER}/${REPO_NAME}"
        exit 1
    fi

    # Calculate days since release
    local days_since
    days_since=$(days_since_release "${release_date}")

    echo "Latest release was ${days_since} days ago (published: ${release_date})"

    # Check if it exceeds the threshold
    if [[ ${days_since} -gt ${DAYS_THRESHOLD} ]]; then
        echo "ALERT: No release for ${REPO_OWNER}/${REPO_NAME} in the last ${DAYS_THRESHOLD} days! Last release was ${days_since} days ago."
        exit 2
    else
        echo "OK: Recent release found for ${REPO_OWNER}/${REPO_NAME} (${days_since} days ago)"
        exit 0
    fi
}

# Check if gh CLI is available
if ! command -v gh > /dev/null 2>&1; then
    echo "ERROR: GitHub CLI (gh) is required but not installed" >&2
    echo "Please install gh: https://cli.github.com/" >&2
    exit 1
fi

# Check if user is authenticated with gh
if ! gh auth status > /dev/null 2>&1; then
    echo "ERROR: You are not authenticated with GitHub CLI" >&2
    echo "Please run: gh auth login" >&2
    exit 1
fi

# Run main function
main