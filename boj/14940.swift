// https://www.acmicpc.net/problem/14940

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var map: [[Int]] = []
for _ in 0..<n {
  let line = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  map.append(line)
}

var answer: [[Int]] = Array(repeating: Array(repeating: -1, count: m), count: n)
var start: (Int, Int) = (0, 0)
for i in 0..<n {
  for j in 0..<m {
    if map[i][j] == 2 {
      start = (i, j)
    }
    if map[i][j] == 0 {
      answer[i][j] = 0
    }
  }
}

var queue: [(Int, Int)] = [(start.0, start.1)]
answer[start.0][start.1] = 0
var index = 0
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while queue.count > index {
  let currentNode = queue[index]
  for d in 0..<4 {
    let newNode = (currentNode.0 + dx[d], currentNode.1 + dy[d])
    guard newNode.0 >= 0 && newNode.1 >= 0 && newNode.0 < n && newNode.1 < m else { continue }
    guard answer[newNode.0][newNode.1] < 0 else { continue }
    guard map[newNode.0][newNode.1] > 0 else {
      answer[newNode.0][newNode.1] = 0
      continue
    }
    answer[newNode.0][newNode.1] = answer[currentNode.0][currentNode.1] + 1
    queue.append((newNode.0, newNode.1))
  }
  index += 1
}

for i in 0..<n {
  var line = ""
  for j in 0..<m {
    line += "\(answer[i][j]) "
  }
  line.removeLast()
  print(line)
}