// https://www.acmicpc.net/problem/1018

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var map: [[String]] = Array(repeating: [], count: n)
for i in 0..<n {
  map[i] = readLine()!.map { String($0) }
}

var answer = 64

var x = 0
repeat {
  var y = 0
  repeat {
    var isWhite: Bool = false
    var count = 64

    for i in 0..<8 {
      for j in 0..<8 {
        if isWhite {
          if map[x + i][y + j] == "W" {
            count -= 1
          }
        } else {
          if map[x + i][y + j] == "B" {
            count -= 1
          }
        }
        isWhite.toggle()
      }
      isWhite.toggle()
    }
    answer = answer < count ? answer : count

    isWhite = true
    count = 64

    for i in 0..<8 {
      for j in 0..<8 {
        if isWhite {
          if map[x + i][y + j] == "W" {
            count -= 1
          }
        } else {
          if map[x + i][y + j] == "B" {
            count -= 1
          }
        }
        isWhite.toggle()
      }
      isWhite.toggle()
    }
    answer = answer < count ? answer : count
    y += 1
  } while y <= m - 8
  x += 1
} while x <= n - 8

print(answer)