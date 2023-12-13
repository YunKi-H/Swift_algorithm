// https://www.acmicpc.net/problem/1929

import Foundation

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = mn[0]
let n = mn[1]
var primes: [Int] = Array(m...n)

func isPrime(_ num: Int) -> Bool {
  if num == 1 { return false }
  var i = 2
  while i * i <= num {
    if num % i == 0 {
      return false
    }
    i += 1
  }
  return true
}

for i in m...n {
  if isPrime(i) {
    print(i)
  }
}