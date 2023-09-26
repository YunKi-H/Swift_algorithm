// https://www.acmicpc.net/problem/2440
let n = Int(readLine()!)!

for i in 0..<n {
	for _ in i..<n {
		print("*", terminator: "")
	}
	print("")
}
