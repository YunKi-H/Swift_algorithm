// https://www.acmicpc.net/problem/10828

let n = Int(readLine()!)!
var stack: [Int] = []
for _ in 0..<n {
    let cmd = readLine()!
        .split(separator: " ")
    switch cmd[0] {
    case "push":
        stack.append(Int(String(cmd[1]))!)
    case "pop":
        print(stack.popLast() ?? -1)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    default:
        print(stack.last ?? -1)
    }
}
