package main

import (
	"bytes"
	"fmt"
	"log"
	"os/exec"
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

	fmt.Printf("exec: %v\n", out.String())
}
