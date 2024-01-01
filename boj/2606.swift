// https://www.acmicpc.net/problem/2606

// import Foundation

// /// BFS
// let pc = Int(readLine()!)!
// var graph: [[Int]] = Array(repeating: [], count: pc + 1)
// var visited: [Bool] = Array(repeating: false, count: pc + 1)
// let line = Int(readLine()!)!
// for _ in 0..<line {
//   let connect = readLine()!.split { $0 == " " }.map { Int(String($0))! }
//   graph[connect[0]].append(connect[1])
//   graph[connect[1]].append(connect[0])
// }

// var queue = [1]
// var index = 0
// visited[1] = true

// while queue.count > index {
//   let currendNode = queue[index]
//   for nextNode in graph[currendNode] {
//     if !visited[nextNode] {
//       visited[nextNode] = true
//       queue.append(nextNode)
//     }
//   }
//   index += 1
// }

// print(visited.filter { $0 }.count - 1)

/// DFS
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited: [Bool] = Array(repeating: false, count: n + 1)

for _ in 0..<m {
  let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  let a = input[0]
  let b = input[1]
  graph[a].append(b)
  graph[b].append(a)
}

func dfs(node: Int) {
  visited[node] = true

  for nextNode in graph[node] where !visited[nextNode] {
    dfs(node: nextNode)
  }
}

dfs(node: 1)
print(visited.filter { $0 }.count - 1)