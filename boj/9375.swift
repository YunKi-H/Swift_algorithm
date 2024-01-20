// https://www.acmicpc.net/problem/9375

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  var closet: [String: Int] = [:]
  for _ in 0..<n {
    let dress = readLine()!.split { $0 == " " }.map { String($0) }
    closet[dress[1], default: 0] += 1
  }
  var cases = 1
  for dress in closet.values {
    cases *= dress + 1
  }
  print(cases - 1)
}