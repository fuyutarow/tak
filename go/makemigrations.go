package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func useBufioScanner(fileName string) {
	fp, err := os.Open(fileName)
	if err != nil {
		panic(err)
	}
	defer fp.Close()

	scanner := bufio.NewScanner(fp)

	start_Y, start_m, start_d, start_R := "", "", "", ""
	end_Y, end_m, end_d, end_R := "", "", "", ""
	is_working := false
	what, where := "", ""
	prev_line := ""

	for scanner.Scan() {
		line := scanner.Text()
		lis := strings.Split(line, "\t")
		command := lis[0]

		switch command {

		case "start":
			is_working = true
			start_Y = lis[1]
			start_m = lis[2]
			start_d = lis[3]
			start_R = lis[4]

		case "end":
			is_working = false
			end_Y = lis[1]
			end_m = lis[2]
			end_d = lis[3]
			end_R = lis[4]
			if start_Y == end_Y && start_m == end_m && start_d == end_d {
				fmt.Printf("%v,%v,%v,%v,%v,%v,%v\n", what, where, start_Y, start_m, start_d, start_R, end_R)
			} else {
				println("[error] ###############################################")
				println(prev_line)
				println(line)
				fmt.Errorf("This recoded is not supported.")
			}

			what, where = "", ""

		case "commit":
			if !is_working {
				fmt.Errorf("Wrong log.")
				os.Exit(1)
			}
			what = lis[1]
			where = lis[2]
			if what == "" || where == "" {
				println("[alart]", lis)
			}
		}
		prev_line = line
	}
}

func main() {
	useBufioScanner("record.log")
}
