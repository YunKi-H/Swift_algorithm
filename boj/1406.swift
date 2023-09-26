// https://www.acmicpc.net/status?user_id=aoal607&problem_id=1406&from_mine=1

var left = readLine()!
var right = String()
let m = Int(readLine()!)!

for _ in 0..<m {
    let cmd = readLine()!
    switch cmd {
    case "L":
        if (!left.isEmpty) {
            right.append(left.popLast()!)
        }
    case "D":
        if (!right.isEmpty) {
            left.append(right.popLast()!)
        }
    case "B":
        left.popLast()
    default:
        left.append(cmd.last!)
    }
}
print(left + right.reversed())
