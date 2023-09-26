// https://www.acmicpc.net/problem/15552
let t = Int(readLine()!)!

for _ in 1...t {
	let ab = readLine()!.split(separator: " ").map{ Int($0)! }
	print(ab[0] + ab[1])
}
