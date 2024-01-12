// https://www.acmicpc.net/problem/6064

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  let mnxy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
  let (m, n, x, y) = (mnxy[0], mnxy[1], mnxy[2], mnxy[3])

  let maxYear = m * n / gcd(m, n)
  var year = x
  while year <= maxYear {
    let xx = year % m == 0 ? m : year % m
    let yy = year % n == 0 ? n : year % n
    if xx == x && yy == y { break }
    year += m
  }
  print(year > maxYear ? -1 : year)
}

func gcd(_ a: Int, _ b: Int) -> Int {
  if a > b {
    if b == 0 { return a }
    return gcd(b, a % b)
  } else {
    if a == 0 { return b }
    return gcd(a, b % a)
  }
}