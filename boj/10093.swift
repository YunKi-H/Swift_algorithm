// https://www.acmicpc.net/problem/10093
let arr = readLine()!.split(separator: " ").map { Int($0)! }

if arr[0] == arr[1] {
	print(0)
} else {
	print(abs(arr[0] - arr[1]) - 1)
	for i in arr[0] <= arr[1] ? (arr[0] + 1)..<arr[1] : (arr[1] + 1)..<arr[0] {
		print(i, terminator: " ")
	}
}
