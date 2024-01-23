// https://www.acmicpc.net/problem/9019

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  let (a, b) = (ab[0], ab[1])
  var queue: [(Int, Int)] = [(a, 0)]
  var visited: [Bool] = .init(repeating: false, count: 10001)
  visited[a] = true
  var index = 0
  while queue.count > index {
    let (num, opers) = queue[index]
    guard num != b else {
      var answer = ""
      for oper in String(opers) {
        switch oper {
        case "1": answer += "D"
        case "2": answer += "S"
        case "3": answer += "L"
        case "4": answer += "R"
        default: break
        }
      }
      print(answer)
      break
    }
    visited[num] = true
    // D == 1
    let numD = num * 2 % 10000
    if !visited[numD] {
      visited[numD] = true
      queue.append((numD, opers * 10 + 1))
    }
    // S == 2
    let numS = num - 1 < 0 ? 9999 : num - 1
    if !visited[numS] {
      visited[numS] = true
      queue.append((numS, opers * 10 + 2))
    }
    // L == 3
    let numL = (num % 1000) * 10 + num / 1000
    if !visited[numL] {
      visited[numL] = true
      queue.append((numL, opers * 10 + 3))
    }
    // R == 4
    let numR = (num % 10) * 1000 + num / 10
    if !visited[numR] {
      visited[numR] = true
      queue.append((numR, opers * 10 + 4))
    }
    index += 1
  }
}