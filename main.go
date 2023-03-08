package main

import (
	"bytes"
	"context"
	"fmt"
	"log"
	"os/exec"

	"github.com/google/go-github/v50/github"
)

func main() {
	args := []string{"hello world!"}

	cmd := exec.Command("echo", args...)

	fmt.Printf("cmd: %q\n", cmd.Args)

	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("cmd exec: %v\n", out.String())

	client := github.NewClient(nil)

	// list all organizations for user "willnorris"
	orgs, _, err := client.Organizations.List(context.Background(), "cpanato", nil)
	if err != nil {
		log.Fatal(err)
	}

	for _, org := range orgs {
		fmt.Println(org.Name)
	}
}
