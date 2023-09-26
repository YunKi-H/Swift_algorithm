// https://www.acmicpc.net/problem/10866

let n: Int = Int(readLine()!)!
var deque: [Int] = []

for _ in 0..<n {
    let cmd = readLine()!
        .split(separator: " ")

    switch cmd[0] {
    case "push_front":
        deque.insert(Int(String(cmd[1]))!, at: 0)
    case "push_back":
        deque.append(Int(String(cmd[1]))!)
    case "pop_front":
        if !deque.isEmpty {
            print(deque.removeFirst())
        } else {
            print(-1)
        }
    case "pop_back":
        print(deque.popLast() ?? -1)
    case "size":
        print(deque.count)
    case "empty":
        print(deque.isEmpty ? 1 : 0)
    case "front":
        print(deque.first ?? -1)
    case "back":
        print(deque.last ?? -1)
    default:
        continue
    }
}
