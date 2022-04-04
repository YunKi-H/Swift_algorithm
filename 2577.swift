// https://www.acmicpc.net/problem/2577
var arr: [Int] = Array(repeating: 0, count: 10)
var abc = 1
for _ in 1...3 {
	let n = Int(readLine()!)!
	abc *= n
}
let str: String = "\(abc)"
for c in str {
	arr[Int(c.asciiValue!) - 48] += 1
}
for i in arr {
	print(i)
}
