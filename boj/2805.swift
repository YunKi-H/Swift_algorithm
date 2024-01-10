// https://www.acmicpc.net/problem/2805

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int64(String($0))! }
let (n, m) = (nm[0], nm[1])
let trees = readLine()!.split { $0 == " " }.map { Int64(String($0))! }
var minHeight: Int64 = 0
var maxHeight: Int64 = 1000000000

while minHeight <= maxHeight {
  let mid = (minHeight + maxHeight) / 2
  if cutting(mid) < m {
    maxHeight = mid - 1
  } else {
    minHeight = mid + 1
  }
}

print(maxHeight)

func cutting(_ height: Int64) -> Int64 {
  var m: Int64 = 0
  for tree in trees {
    m += max(tree - height, 0)
  }
  return m
}