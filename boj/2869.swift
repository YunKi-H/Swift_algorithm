// https://www.acmicpc.net/problem/2869

import Foundation

let abv = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b, v) = (abv[0], abv[1], abv[2])
print((v - b) / (a - b) + ((v - b) % (a - b) == 0 ? 0 : 1))