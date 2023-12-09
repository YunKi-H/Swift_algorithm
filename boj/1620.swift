// https://www.acmicpc.net/problem/1620

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var input: [String: String] = [:]

for i in 1...n {
    let name = readLine()!
    input[name] = String(i)
    input[String(i)] = name
}
for _ in 0..<m {
    let quiz = readLine()!
    print(input[quiz]!)
}
