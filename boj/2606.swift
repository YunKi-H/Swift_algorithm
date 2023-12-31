// https://www.acmicpc.net/problem/2606

import Foundation

let pc = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: pc + 1)
var visited: [Bool] = Array(repeating: false, count: pc + 1)
let line = Int(readLine()!)!
for _ in 0..<line {
  let connect = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  graph[connect[0]].append(connect[1])
  graph[connect[1]].append(connect[0])
}

// func bfs(node: Int) {
  var queue: [Int] = [1]
  var index = 0
  visited[1] = true

  while queue.count > index {
    let currendNode = queue[index]
    for nextNode in graph[currendNode] {
      if !visited[nextNode] {
        visited[nextNode] = true
        queue.append(nextNode)
      }
    }
    index += 1
  }
// }

// bfs(node: 1)
print(visited.filter { $0 }.count - 1)