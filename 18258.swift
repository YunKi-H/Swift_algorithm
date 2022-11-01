// https://www.acmicpc.net/problem/18258
// timeout
var queue: [Int] = []
let n: Int = Int(readLine()!)!

for _ in 0..<n {
    let cmd = readLine()!.split(separator: " ")
    switch cmd[0] {
    case "push":
        queue.append(Int(String(cmd[1]))!)
    case "pop":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.removeFirst())
        }
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        print(queue.first ?? -1)
    case "back":
        print(queue.last ?? -1)
    default:
        continue
    }
}
