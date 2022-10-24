// https://www.acmicpc.net/problem/10773

let k = Int(readLine()!)!
var stack: [Int] = []
for _ in 0..<k {
    let input = Int(readLine()!)!

    if input == 0 {
        stack.popLast()
    } else {
        stack.append(input)
    }
}

var answer = 0
while !stack.isEmpty {
    answer += stack.popLast()!
}
print(answer)
