// https://www.acmicpc.net/problem/5397

let n = Int(readLine()!)!

for _ in 0..<n {
    var left = String()
    var right = String()
    let keylog = readLine()!

    for c in keylog {
        switch c {
        case "<":
            if !left.isEmpty {
                right.append(left.popLast()!)
            }
        case ">":
            if !right.isEmpty {
                left.append(right.popLast()!)
            }
        case "-":
            left.popLast()
        default:
            left.append(c)
        }
    }
    print(left + right.reversed())
}
