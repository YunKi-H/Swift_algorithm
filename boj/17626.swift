// https://www.acmicpc.net/problem/17626

import Foundation

let n = Int(readLine()!)!
var sum: [Int] = Array(repeating: 4, count: n + 1)
sum[0] = 0
for num in 1 ... n {
  var d = 1
  while d * d <= num {
    sum[num] = min(sum[num - d * d] + 1, sum[num])
    d += 1
  }
}
print(sum[n])