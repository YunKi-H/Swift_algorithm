// https://www.acmicpc.net/problem/1021

let nm = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }
var deque = Array(1...nm[0])
var count = 0

let input = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }
for i in 0..<nm[1] {
    var cnt = 0
    while deque.first != input[i] {
        deque.insert(deque.popLast()! , at: 0)
        cnt += 1
    }
    count += cnt <= deque.count / 2 ? cnt : deque.count - cnt
    deque.removeFirst()
}
print(count)
