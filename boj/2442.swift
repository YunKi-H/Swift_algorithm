// https://www.acmicpc.net/problem/2442
let n = Int(readLine()!)!

for i in 1...n {
	for _ in 0..<(n - i) {
		print(" ", terminator: "")
	}
	for _ in 0..<(2 * i - 1) {
		print("*", terminator: "")
	}
	print("")
}
