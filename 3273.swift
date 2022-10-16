// https://www.acmicpc.net/problem/3273
var arr: [Int] = Array(repeating: 0, count: 2000001)
let n = Int(readLine()!)!
let input = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }
    .sorted()
let x = Int(readLine()!)!

for i in input {
    arr[i] += 1
}

var result: Int = 0
for i in 0..<n {
    if x - input[i] > 0 && arr[x - input[i]] != 0 {
        result += 1
    }
}
print(result / 2)
