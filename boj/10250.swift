import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
  let hwn: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
  let h = hwn[0]
  let w = hwn[1]
  let n = hwn[2]
  print((n % h == 0 ? h : n % h) * 100 + (n % h == 0 ? n / h : n / h + 1))
}