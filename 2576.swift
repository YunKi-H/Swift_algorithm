// https://www.acmicpc.net/problem/2576

var sum: Int = 0
var min: Int = 100

for _ in 1...7 {
	let input = Int(readLine()!)!
	if input % 2 == 1 {
		sum += input
		if min > input {
			min = input
		}
	}
}
if sum != 0 {
	print(sum)
	print(min)
} else {
	print(-1)
}
