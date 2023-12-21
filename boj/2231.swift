// https://www.acmicpc.net/problem/2231

import Foundation

let n = Int(readLine()!)!

func solution() {
  for i in 1..<n {
    let sum = Array(String(i)).map { Int(String($0))! }.reduce(0, +)
    if i + sum == n {
      print(i)
      return
    }
  }
  print(0)
}
solution()