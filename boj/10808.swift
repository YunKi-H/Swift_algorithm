// https://www.acmicpc.net/problem/10808
var arr: [Int] = Array(repeating: 0, count: 26)
let s = readLine()!

for c in s {
	arr[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] += 1
}

arr.forEach { print($0, terminator: " ") }
