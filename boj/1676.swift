// https://www.acmicpc.net/problem/1676

import Foundation

let n = Int(readLine()!)!

var k = 5
var count = 0
while k <= n {
  count += n / k
  k *= 5
}
print(count)