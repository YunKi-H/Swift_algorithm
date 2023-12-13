// https://www.acmicpc.net/problem/2609

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let a = input[0]
let b = input[1]

func gcd(_ num1: Int, _ num2: Int) -> Int {
  if num2 == 0 {
    return num1
  }
  return (gcd(num2, num1 % num2))
}

let d = gcd(a, b)

print(d)
print(a * b / d)