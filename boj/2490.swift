// https://www.acmicpc.net/problem/2490

for _ in 1...3 {
	let arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
	if arr[3] == 0 {
		print("D")
	} else if arr[2] == 0 {
		print("C")
	} else if arr[1] == 0 {
		print("B")
	} else if arr[0] == 0 {
		print("A")
	} else {
		print("E")
	}
}
