
# Staging Env Services

## Cloud Run services

<!-- AUTOGEN START SERVICES: automated genereted please do not edit -->
| Kind | Name | Team | Locations | Playbooks |
|------|------|-------|-----------|-----------|
| Service | enforce-staging-cs-wq-dsp |  | us-central1, us-east4, us-west1 | [ Playbooks](../../playbooks/teams//services/) |
| Service | enforce-staging-cs-wq-rcv |  | us-central1, us-east4, us-west1 | [ Playbooks](../../playbooks/teams//services/) |
| Service | ai-build-failure | acceleration | us-central1, us-east4, us-west1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Service | apk-sbom-gen | acceleration | us-central1, us-east4, us-west1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Service | cve-patch-forge | acceleration | us-central1, us-east4, us-west1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Service | eol-cve-triage | acceleration | us-central1, us-east4, us-west1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Service | fulfilled | acceleration | us-central1, us-east4, us-west1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Service | update-wolfi | acceleration | us-central1, us-east4, us-west1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Service | apk-copier-extras | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | apk-copier-wolfi | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | build-extras | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | build-wolfi | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | ci-apk-add | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | ci-cve-scan | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | ci-diff-report | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | ci-mal-report | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | ci-sbom-validity | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | ci-so-check | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | dockerhub-sync-dockerhub-sync | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-apk | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-apkoaas | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-datastore-registry | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-ing-sbom | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-registry | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-sync-svc-pcp | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-syncer-baby-backstop | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-syncer-fanout | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-syncer-reconciler | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | epoch-bot | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | grype-scan-service-large | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | grype-scan-service-medium | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | grype-scan-service-small | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | grype-scan-service-xlarge | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | kms-init | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-apk-pull-v2 | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-build-job-extra | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-build-job-wolfi | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-build-svc-extra | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-build-svc-wolfi | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-registry-pull-v2 | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-registry-push-v2 | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | prb-wolfi | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | scarf-sh-scarf-recorder | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | trivy-scan-service-large | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | trivy-scan-service-medium | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | trivy-scan-service-small | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | trivy-scan-service-xlarge | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | vuln-scan-push-listener | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | vuln-scan-scan-results-listener | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Service | enforce-staging-custsignu | experience | us-central1, us-east4, us-west1 | [experience Playbooks](../../playbooks/teams/experience/services/) |
| Service | enforce-staging-api | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-datastore-ecosystems | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-datastore-iam | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-datastore-tenant | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-enforce-github | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-gh-events | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-ingress | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-oidc-canary | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-oidc-imp | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-oidc-issuer | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-rec | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-wh-delivery | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-wh-fanout | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | gh-adv-push | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | prb-api-v2 | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | prb-external-idp | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | prb-issuer-v2 | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | prb-okta | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | service-principal-backfill | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | stg-libraries | platform | us-central1, us-east4, us-west1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Service | enforce-staging-tar2efi | vms | us-central1, us-east4, us-west1 | [vms Playbooks](../../playbooks/teams/vms/services/) |
<!-- AUTOGEN END SERVICES: automated genereted please do not edit -->

## Cloud Run Jobs

<!-- AUTOGEN START JOBS: automated genereted please do not edit -->
| Kind | Name | Team | Locations | Playbooks |
|----- |------|-------|-----------|-----------|
| Job | honk-dwp3-cron | acceleration | us-central1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Job | lc-cve-dashboard-bot-cron | acceleration | us-central1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Job | lc-update-bot-wolfi-cron | acceleration | us-central1 | [acceleration Playbooks](../../playbooks/teams/acceleration/services/) |
| Job | apkmeta-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | build-post-extras-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | build-post-wolfi-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | build-pre-extras-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | build-pre-wolfi-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | build-world-extras-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | build-world-wolfi-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | catalog-syncer-backstop-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | dockerhub-sync-data-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | eol-notify-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | eol-notify-cuda-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | eol-notify-cuda-dryrun-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | eol-notify-dryrun-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | grype-db-us-central1-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | grype-db-us-east4-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | grype-db-us-west1-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | image-scan-request-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | kms-init-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | registry-blob-backup-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | registry-gorm-automigrate-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | sfdc-catalog-export-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | sfdc-entitlement-import-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | trivy-db-us-central1-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | trivy-db-us-east4-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | trivy-db-us-west1-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | vuln-scan-grype-bq-jobs-cron | containers | us-central1, us-east4, us-west1 | [containers Playbooks](../../playbooks/teams/containers/services/) |
| Job | advisory-ing-enterprise-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | advisory-ing-extras-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | advisory-ing-wolfi-dev-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | cloudsql-backup-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | eco-gorm-automigrate-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | entitlements-reconciler-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | iam-gorm-automigrate-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | oidc-key-rotator-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | purl-backfiller-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | role-init-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | sql-iam-init-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | svc-pcp-backfill-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
| Job | tenant-gorm-automigrate-cron | platform | us-central1 | [platform Playbooks](../../playbooks/teams/platform/services/) |
<!-- AUTOGEN END JOBS: automated genereted please do not edit -->

<!-- Manual edits below this -->
