// https://www.acmicpc.net/problem/1764

import Foundation

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var listenLess: Set<String> = Set<String>()
var answer: [String] = []
for _ in 0..<n {
    listenLess.insert(readLine()!)
}
for _ in 0..<m {
    let name = readLine()!
    if listenLess.contains(name) {
        answer.append(name)
    }
}
print(answer.count)
for name in answer.sorted() {
    print(name)
}
