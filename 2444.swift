// https://www.acmicpc.net/problem/2444
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
for i in 1..<n {
	for _ in 0..<i {
		print(" ", terminator: "")
	}
	for _ in 0..<(2 * (n - i) - 1) {
		print("*", terminator: "")
	}
	print("")
}
