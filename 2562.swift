// https://www.acmicpc.net/problem/2562
var max = 0
var maxidx = 0

for i in 1...9 {
	let input = Int(readLine()!)!
	if max < input {
		max = input
		maxidx = i
	}
}
print(max)
print(maxidx)
