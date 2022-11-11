// https://www.acmicpc.net/problem/10799

let stick = readLine()!
var piece = 0
var stk: [Character] = []
var isLaser = true
for c in stick {
    switch c {
    case "(":
        stk.append("(")
        isLaser = true
    default:
        stk.removeLast()
        piece += isLaser ? stk.count : 1
        isLaser = false
    }
}
print(piece)
