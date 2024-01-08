// https://www.acmicpc.net/problem/1260

import Foundation

let nmv = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)

for _ in 0..<m {
  let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  let a = ab[0]
  let b = ab[1]
  graph[a].append(b)
  graph[b].append(a)
}
for i in 0...n {
  graph[i].sort()
}
var dfsString = ""
var bfsString = ""

func dfs(_ node: Int) {
  if visited[node] { return }
  visited[node] = true
  dfsString += "\(node) "
  for nextNode in graph[node] {
    dfs(nextNode)
  }
}
dfs(v)

visited = Array(repeating: false, count: n + 1)
func bfs(_ node: Int) {
  var queue: [Int] = [node]
  visited[node] = true
  bfsString += "\(node) "
  var index = 0

  while queue.count > index {
    let currentNode = queue[index]
    for nextNode in graph[currentNode] {
      if visited[nextNode] { continue }
      visited[nextNode] = true
      bfsString += "\(nextNode) "
      queue.append(nextNode)
    }
    index += 1
  }
}
bfs(v)

dfsString.removeLast()
bfsString.removeLast()
print(dfsString)
print(bfsString)