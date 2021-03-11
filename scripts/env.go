package main

import (
	"io/ioutil"
	"os"
	"strings"
)

func main() {
	value := os.Args[1]
	keys := []string{"GOOS", "GOARCH", "GOARM"}
	values := strings.Split(value, "/")
	template := "export <x>=<y>\n"
	result := ""
	for i, val := range values {
		if i == 2 {
			val = val[1:]
		}
		line := strings.ReplaceAll(template, "<x>", keys[i])
		line = strings.ReplaceAll(line, "<y>", val)
		result += line
	}
	ioutil.WriteFile("./vars", []byte(result), 0777)
}