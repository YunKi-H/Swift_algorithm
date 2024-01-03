// https://www.acmicpc.net/problem/2630

import Foundation

let n = Int(readLine()!)!

var map: [[Int]] = []
for _ in 0..<n {
  map.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}
var colors = [0, 0]

func isValid(x: Int, y: Int, n: Int) -> Bool {
  let kind = map[x][y]
  for i in x ..< x + n {
    for j in y ..< y + n {
      if map[i][j] != kind {
        return false
      }
    }
  }
  colors[kind] += 1
  return true
}

func recursive(x: Int, y: Int, n: Int) {
  if isValid(x: x, y: y, n: n) {
    return
  }
  let m = n / 2
  recursive(x: x, y: y, n: m)
  recursive(x: x + m, y: y, n: m)
  recursive(x: x, y: y + m, n: m)
  recursive(x: x + m, y: y + m, n: m)
}

recursive(x: 0, y: 0, n: n)
print(colors[0])
print(colors[1])