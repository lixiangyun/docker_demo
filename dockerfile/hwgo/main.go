package main

import "fmt"
import "os"

func main() {

	fmt.Println("Hello world!")

	args := os.Args

	if len(args) > 1 {
		for i, v := range args {
			fmt.Println("Args(", i, "): ", v)
		}
	}
}
