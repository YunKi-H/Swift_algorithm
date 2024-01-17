// https://www.acmicpc.net/problem/16928

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var route: [Int: Int] = [:]
for _ in 0..<n {
  let xy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  route[xy[0]] = xy[1]
}
for _ in 0..<m {
  let xy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  route[xy[0]] = xy[1]
}

var map: [Int] = Array(repeating: 0, count: 101)
var visited: [Bool] = Array(repeating: false, count: 101)

var queue = [1]
var index = 0
while queue.count > index {
  let currentNode = queue[index]
  visited[currentNode] = true
  for i in 1...6 {
    var newNode = currentNode + i
    if let moved = route[newNode] {
      newNode = moved
    }
    guard 1...100 ~= newNode else { continue }
    guard !visited[newNode] else { continue }

    queue.append(newNode)
    map[newNode] = map[currentNode] + 1
    visited[newNode] = true
  }

  index += 1
}
print(map[100])