// https://www.acmicpc.net/problem/10808
var arr: [Int] = Array(repeating: 0, count: 26)
let s = readLine()!

for c in s {
	arr[Int(c.asciiValue!) - 97] += 1
}

arr.forEach { print($0, terminator: " ") }
