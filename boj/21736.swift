// https://www.acmicpc.net/problem/21736

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var map: [[String]] = []
for _ in 0..<n {
  map.append(readLine()!.map { String($0) })
}

var start: (x: Int, y: Int) = (0, 0)
for i in 0..<n {
  for j in 0..<m {
    if map[i][j] == "I" {
      start.x = i
      start.y = j
    }
  }
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
var count = 0

func dfs(_ node: (x: Int, y: Int)) {
  guard node.x >= 0 && node.x < n && node.y >= 0 && node.y < m else { return }
  guard map[node.x][node.y] != "X" else { return }
  guard !visited[node.x][node.y] else { return }

  if map[node.x][node.y] == "P" {
    count += 1
  }
  visited[node.x][node.y] = true
  for d in 0..<4 {
    let newNode: (x: Int, y: Int) = (node.x + dx[d], node.y + dy[d])
    dfs(newNode)
  }
}

dfs(start)

if count == 0 {
  print("TT")
} else {
  print(count)
}