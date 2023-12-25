// https://www.acmicpc.net/problem/15964

import Foundation

let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
print((ab[0] + ab[1]) * (ab[0] - ab[1]))