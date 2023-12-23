// https://www.acmicpc.net/problem/18110

import Foundation

let n = Int(readLine()!)!
var levels: [Double] = []
for _ in 0..<n {
  levels.append( Double(readLine()!)! )
}
levels.sort()

if n > 0 {
  let cut = Int(round(Double(levels.count) * 0.15))

  var level: Double = 0
  for i in cut..<(levels.count - cut) {
    level += levels[i]
  }
  level /= Double(levels.count - cut * 2)

  print(Int(round(level)))
} else {
  print(0)
}