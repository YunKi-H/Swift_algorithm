// https://www.acmicpc.net/problem/18111

import Foundation

let nmb = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nmb[0]
let m = nmb[1]
let b = nmb[2]

var map = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
  let line = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  for j in 0..<m {
    map[i][j] = line[j]
  }
}

var minTime = Int.max
var finalHeight = 0
for height in 0...256 {
  var inven = b
  var time = 0

  for i in 0..<n {
    for j in 0..<m {
      if map[i][j] > height {
        time += 2 * (map[i][j] - height)
        inven += map[i][j] - height
      } else if map[i][j] < height {
        time += height - map[i][j]
        inven -= height - map[i][j]
      }
    }
  }

  if inven < 0 { break }
  if time <= minTime {
    minTime = time
    finalHeight = height
  }
}
print(minTime, finalHeight)