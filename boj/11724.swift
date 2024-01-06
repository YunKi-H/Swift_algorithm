// https://www.acmicpc.net/problem/11724

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)
for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let u = input[0]
  let v = input[1]
  graph[u].append(v)
  graph[v].append(u)
}

var count = 0
var queue: [Int] = []
var index = 0
for i in 1...n {
  queue.append(i)
  if visited[i] { continue }
  count += 1
  while queue.count > index {
    let currendNode = queue[index]
    for newNode in graph[currendNode] {
      if visited[newNode] { continue }
      visited[newNode] = true
      queue.append(newNode)
    }
    index += 1
  }
}
print(count)