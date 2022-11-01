// https://www.acmicpc.net/problem/2164
// timeout
let n: Int = Int(readLine()!)!
var queue: [Int] = Array(1...n).reversed()

while queue.count > 1 {
    queue.removeLast()
    if queue.count > 1 {
        queue.insert(queue.popLast()!, at: 0)
    }
}
print(queue.first!)
