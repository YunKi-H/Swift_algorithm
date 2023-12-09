// https://www.acmicpc.net/problem/1654

import Foundation

let kn = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = kn[0]
let n = kn[1]

var lines: [Int] = []
for _ in 0..<k {
  lines.append(Int(readLine()!)!)
}

var first = 1
var last = lines.max()!

var result = 0

while first <= last {
  let mid = (first + last) / 2
  var sum = lines.map({ $0 / mid }).reduce(0, +)

  if sum >= n {
    if result < mid {
      result = mid
    }
    first = mid + 1
  } else {
    last = mid - 1
  }
}

print(result)