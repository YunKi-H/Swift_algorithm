// https://www.acmicpc.net/problem/1931

import Foundation

let n = Int(readLine()!)!
var arr: [(start: Int, end: Int)] = []
for _ in 0..<n {
  let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  arr.append((input[0], input[1]))
}
arr.sort {
  if $0.end == $1.end {
    return $0.start < $1.start
  }
  return $0.end < $1.end
}

var count = 0
var lastTime = 0
for session in arr {
  if session.start >= lastTime {
    lastTime = session.end
    count += 1
  }
}
print(count)