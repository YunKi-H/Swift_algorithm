// https://www.acmicpc.net/problem/11659

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = nm[1]
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 1..<arr.count {
  arr[i] = arr[i - 1] + arr[i]
}

for _ in 0..<m {
  let range = readLine()!.split(separator: " ").map { Int(String($0))! }
  let a = range[0] == 1 ? 0 : arr[range[0] - 2]
  let b = arr[range[1] - 1]
  print(b - a)
}