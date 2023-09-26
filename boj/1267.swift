// https://www.acmicpc.net/problem/1267
let n: Int = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
var Y = 0
var M = 0

for i in 0..<n {
	Y += (arr[i] / 30) * 10
	if arr[i] > 0 {
		Y += 10
	}
	M += (arr[i] / 60) * 15
	if arr[i] > 0 {
		M += 15
	}
}

if Y < M {
	print("Y \(Y)")
} else if Y > M {
	print("M \(M)")
} else {
	print("Y M \(Y)")
}
