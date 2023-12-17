// https://www.acmicpc.net/problem/11866

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var arr = Array(1...nk[0])
let k = nk[1]

var answer = "<"
var count = 1
var i = 0
while !arr.isEmpty {
  if i >= arr.count { i = 0 }
  if count % k == 0 {
    answer += "\(arr[i])"
    arr.remove(at: i)
    if !arr.isEmpty {
      answer += ", "
    }
    i -= 1
  }
  count += 1
  i += 1
}
answer += ">"
print(answer)