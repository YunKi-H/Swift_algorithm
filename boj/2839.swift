// https://www.acmicpc.net/problem/2839

import Foundation

let n = Int(readLine()!)!
var bag = n / 5

while bag >= 0 && (n - bag * 5) % 3 != 0 {
  bag -= 1
}

if bag < 0 {
  print(-1)
} else {
  print(bag + (n - bag * 5) / 3)
}