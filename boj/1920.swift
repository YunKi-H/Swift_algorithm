// https://www.acmicpc.net/problem/1920

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dict: [Int: Int] = [:]
for i in arr {
  dict[i] = 1
}
let m = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
for num in numbers {
  guard dict[num] != nil else {
    print(0)
    continue
  }
  print(1)
}