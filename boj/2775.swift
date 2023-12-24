// https://www.acmicpc.net/problem/2775

import Foundation

var apart = Array(repeating: Array(repeating: 0, count: 15), count: 15)

for i in 0...14 {
  apart[0][i] = i
}
for floor in 1...14 {
  for door in 1...14 {
    apart[floor][door] = apart[floor - 1][door] + apart[floor][door - 1]
  }
}

let t = Int(readLine()!)!
for _ in 0..<t {
  let k = Int(readLine()!)!
  let n = Int(readLine()!)!

  print(apart[k][n])
}