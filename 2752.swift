// https://www.acmicpc.net/problem/2752

var arr = readLine()!.split(separator: " ").map( {Int($0)!} ).sorted()

// print("\(arr[0]) \(arr[1]) \(arr[2])")

for i in arr {
	print(i, terminator: " ")
}
