// https://www.acmicpc.net/problem/15829

import Foundation

let l = Int64(readLine()!)
let string = readLine()!.map { String($0) }
var dictionary: [String: Int64] = [:]
for (i, c) in "abcdefghijklmnopqrstuvwxyz".map({ String($0) }).enumerated() {
  dictionary[c] = Int64(i + 1)
}

let r: Int64 = 31
let m: Int64 = 1234567891

var hash: Int64 = 0
for (i, c) in string.enumerated() {
  var R: Int64 = 1
  for _ in 0..<i {
    R *= 31
    R %= m
  }
  hash += dictionary[c]! * R
  hash %= m
}
print(hash)