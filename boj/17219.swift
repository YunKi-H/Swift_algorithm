// https://www.acmicpc.net/problem/17219

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var password: [String: String] = [:]
for _ in 0..<n {
  let memo = readLine()!.split { $0 == " " }.map { String($0) }
  password[memo[0]] = memo[1]
}
for _ in 0..<m {
  let site = readLine()!
  print(password[site] ?? "")
}