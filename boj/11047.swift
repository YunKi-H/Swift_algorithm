// https://www.acmicpc.net/problem/11047

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
var k = nk[1]
var coins: [Int] = []
for _ in 0..<n {
  coins.append(Int(readLine()!)!)
}
var count = 0
for coin in coins.reversed() {
  count += k / coin
  k %= coin
}
print(count)