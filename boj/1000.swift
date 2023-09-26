// https://www.acmicpc.net/problem/1000
if let input = readLine() {
	let inputArr = input.split(separator: " ").map{String($0)}
	print(Int(inputArr[0])! + Int(inputArr[1])!)
}
