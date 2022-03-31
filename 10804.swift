// https://www.acmicpc.net/problem/10804
var arr = Array(1...20)

for _ in 1...10 {
	let range = readLine()!.split(separator: " ").map{ Int($0)! }
	let startIdx = range[0] - 1
	let endIdx = range[1] - 1
	for i in 0...((endIdx - startIdx) / 2) {
		let tmp: Int
		tmp = arr[startIdx + i]
		arr[startIdx + i] = arr[endIdx - i]
		arr[endIdx - i] = tmp
	}
}
for i in arr {
	print(i, terminator: " ")
}
