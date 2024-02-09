import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    return String(n, radix: k).split { $0 == "0" }.map { Int(String($0))! }.filter {
        if $0 == 1 { return false }
        var i = 2
        while i * i <= $0 {
            if $0 % i == 0 { return false }
            i += 1
        }
        return true
    }.count
}