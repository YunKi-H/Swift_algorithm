// https://www.acmicpc.net/problem/2753

let year = Int(readLine()!)!
var moon: Bool = false

if year % 4 == 0 {
	if year % 100 == 0 {
		if year % 400 == 0 {
			moon = true
		} else {
			moon = false
		}
	} else {
		moon = true
	}
} else {
	moon = false
}
if moon {
	print("1")
} else {
	print("0")
}
