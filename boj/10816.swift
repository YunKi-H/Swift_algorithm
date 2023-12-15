// https://www.acmicpc.net/problem/10816

import Foundation

let n = Int(readLine()!)!
let cards = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }

var dict: [Int: Int] = [:]

for card in cards {
  if dict[card] == nil {
    dict[card] = 1
  } else {
    dict[card]! += 1
  }
}

for i in 0..<nums.count {
  nums[i] = dict[nums[i]] ?? 0
}

var answer: String = ""
for num in nums {
  answer += "\(num) "
}
answer.removeLast()
print(answer)