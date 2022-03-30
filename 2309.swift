// https://www.acmicpc.net/problem/2309
var arr: [Int] = []
var result: [Int] = []
for _ in 1...9 {
	arr.append(Int(readLine()!)!)
}

func combination(_ target: [Int], _ count: Int, _ idx: Int, _ tmp: [Int]) {
	if tmp.count == count {
		var sum = 0
		for i in 0..<7 {
			sum += tmp[i]
		}
		if sum == 100 {
			for _ in 0..<7 {
				result = tmp
			}
			return
		}
		return
	}

	for i in idx..<target.count {
		combination(target, count, i + 1, tmp + [target[i]])
	}
}

combination(arr, 7, 0, [])
result.sort()
for i in 0..<7 {
	print(result[i])
}
