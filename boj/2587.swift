// https://www.acmicpc.net/problem/2587

var arr: [Int] = []
var avg = 0
for _ in 1...5 {
	arr.append(Int(readLine()!)!)
}
arr.sort()
for i in 0..<5 {
	avg += arr[i]
}
print(avg / 5)
print(arr[2])
