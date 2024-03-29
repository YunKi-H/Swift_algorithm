import Foundation

func solution(_ s:String) -> Bool {
    var count = 0
    for c in s {
        if c == ")" && count <= 0 { return false }
        if c == "(" { count += 1 }
        else if c == ")" { count -= 1 }
    }
    return count == 0
}
