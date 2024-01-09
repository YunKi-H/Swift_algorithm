// https://www.acmicpc.net/problem/1389

import Foundation

let nm = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var graph: [[Int]] = Array(repeating: [], count: n + 1)
for _ in 0..<m {
  let ab = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
  let (a, b) = (ab[0], ab[1])
  if graph[a].contains(b) { continue }
  graph[a].append(b)
  graph[b].append(a)
}
var sum: [Int] = Array(repeating: 0, count: n + 1)

for startNode in 1...n {
  var queue: [Int] = [startNode]
  var visited: [Bool] = Array(repeating: false, count: n + 1)
  var distances: [Int] = Array(repeating: 0, count: n + 1)
  visited[startNode] = true
  var index = 0
  while queue.count > index {
    let currentNode = queue[index]
    for newNode in graph[currentNode] {
      if visited[newNode] { continue }
      distances[newNode] = distances[currentNode] + 1
      visited[newNode] = true
      queue.append(newNode)
    }
    index += 1
  }
  sum[startNode] = distances.reduce(0, +)
}
sum.removeFirst()
print(sum.firstIndex(of: sum.min()!)! + 1)