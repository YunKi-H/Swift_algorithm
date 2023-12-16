// https://www.acmicpc.net/problem/11050

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var n = nk[0]
let k = nk[1]

var top = 1
for _ in 0..<k {
  top *= n
  n -= 1
} 
var bottom = 1
if k != 0 {
  for i in 1...k {
    bottom *= i
  }
}

print(top / bottom)