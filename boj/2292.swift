// https://www.acmicpc.net/problem/2292

import Foundation

let n = Int(readLine()!)!

var room = 1
var floor = 1
while room < n {
  room += (floor - 1) * 6
  floor += 1
}
if n == 1 { print(1) }
else { print(floor - 1) }