// https://www.acmicpc.net/problem/2443
let n = Int(readLine()!)!

for i in 0..<n {
	for _ in 0..<i {
		print(" ", terminator: "")
	}
	for _ in 0..<(2 * (n - i) - 1) {
		print("*", terminator: "")
	}
	print("")
}
