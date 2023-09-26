// https://www.acmicpc.net/problem/1475
var arr: [Int] = Array(repeating: 0, count: 10)
let n = readLine()!
for c in n {
    arr[Int(c.asciiValue!) - Int(Character("0").asciiValue!)] += 1
}
let sixNine: Int = (arr[6] + arr[9] + 1) / 2
arr[6] = sixNine
arr[9] = sixNine
print(arr.max()!)
