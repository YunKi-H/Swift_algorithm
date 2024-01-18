// https://www.acmicpc.net/problem/11403

import Foundation

let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var visited: [Bool] = Array(repeating: false, count: n)
var answer: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

for node in 0..<n {
  dfs(node, node)
  visited = Array(repeating: false, count: n)
}

func dfs(_ start: Int, _ now: Int) {
  for i in 0..<n {
    guard map[now][i] == 1 else { continue }
    guard !visited[i] else { continue }
    visited[i] = true
    answer[start][i] = 1
    dfs(start, i)
  }
}

for i in 0..<n {
  var str = ""
  for j in 0..<n {
    str += "\(answer[i][j])"
    str += " "
  }
  str.removeLast()
  print(str)
}