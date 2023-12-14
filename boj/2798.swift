// https://www.acmicpc.net/problem/2798

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = nm[1]
let cards = readLine()!.split(separator: " ").map { Int(String($0))! }

var max = 0

func comb(_ idx: Int, _ now: [Int]) {
  guard now.count < 3 else {
    let sum = now.reduce(0, +)
    if sum <= m && sum > max {
      max = sum
    }
    return
  }

  for i in idx..<cards.count {
    comb(i + 1, now + [cards[i]])
  }
}

comb(0, [])

print(max)