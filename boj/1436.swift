// https://www.acmicpc.net/problem/1436

import Foundation

var n = Int(readLine()!)!
var num = 665

while n > 0 {
  num += 1
  var title = num
  while title >= 666 {
    if title % 1000 == 666 {
      n -= 1
      break
    }
    title /= 10
  }
}

print(num)