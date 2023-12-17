// https://www.acmicpc.net/problem/1966

import Foundation

let k = Int(readLine()!)!

for _ in 0..<k {
  let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  var arr = Array(readLine()!.split { $0 == " " }.map { Int(String($0))! }.enumerated())

  let m = nm[1]
  var i = 1
  while true {
    if arr.max(by: { $0.1 < $1.1 })! == arr.first! {
      if arr.first!.0 == m {
        print(i)
        break
      }
      i += 1
      arr.removeFirst()
    } else {
      arr.append(arr.first!)
      arr.removeFirst()
    }
  }
}
