// https://www.acmicpc.net/problem/5525

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map { String($0) }

var count = 0
var isP = false
var pLength = 0
for i in 0..<m {
  if i == 0 {
    if s[i] == "I" {
      isP = true
    }
    continue
  }
  if !isP && s[i] == "I" { isP = true }
  else if isP && s[i] == "I" && s[i - 1] == "O" { pLength += 1 }
  else if isP && s[i] == "O" && s[i - 1] == "I" { continue }
  else {
    if pLength >= n {
      count += pLength - n + 1
    }
    pLength = 0
    isP = s[i] == "I"
  }
}
if pLength >= n {
  count += pLength - n + 1
}
print(count)