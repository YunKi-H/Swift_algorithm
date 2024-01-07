// https://www.acmicpc.net/problem/1107

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var btn: [Int] = []
if m > 0 {
  btn = readLine()!.split { $0 == " " }.map { Int(String($0))! }
}
var count = abs(n - 100)

for i in 0...1000000 {
  var len = 0
  var num = i
  while num > 0 {
    if btn.contains(num % 10) {
      len = 0
      break
    }
    num /= 10
    len += 1
  }
  if i == 0 { len = btn.contains(0) ? 0 : 1 }
  if len > 0 {
    let press = abs(n - i)
    count = min(len + press, count)
  }
}

print(count)