// https://www.acmicpc.net/problem/13300
let nk = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }
var room: [Int] = Array(repeating: 0, count: 13)

for _ in 1...nk[0] {
    let sy = readLine()!
        .split(separator: " ")
        .map{ Int(String($0))! }
    room[sy[0] * 6 + sy[1]] += 1
}

var answer: Int = 0
for i in room {
    answer += i / nk[1] + (i % nk[1] > 0 ? 1 : 0)
}
print(answer)
