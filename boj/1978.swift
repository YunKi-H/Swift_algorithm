// https://www.acmicpc.net/problem/1978

import Foundation

let n = readLine()!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

print(nums.filter { num in
  guard num >= 2 else {
    return false
  }
  var i = 2
  while i * i <= num {
    if num % i == 0 {
      return false
    }
    i += 1
  }
  return true
}.count)
