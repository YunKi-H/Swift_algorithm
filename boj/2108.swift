// https://www.acmicpc.net/problem/2108

import Foundation

let n = Int(readLine()!)!
var arr: [Int] = []
var counts: [Int] = Array(repeating: 0, count: 8001)

for _ in 0..<n {
  let num = Int(readLine()!)!
  counts[num + 4000] += 1
  arr.append(num)
}

let maxNum = counts.max()!
let maxNums = counts.enumerated().filter { $0.1 == maxNum }

print(Int(round(Double(arr.reduce(0, +)) / Double(arr.count))))

print(arr.sorted()[arr.count / 2])

print(maxNums.count == 1 ? maxNums[0].0 - 4000 : maxNums[1].0 - 4000)

print(arr.max()! - arr.min()!)