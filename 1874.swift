// https://www.acmicpc.net/problem/1874

let n = Int(readLine()!)!
var answer: [Character] = []
var stack: [Int] = []
var input: [Int] = []

for _ in 1...n {
    input.append(Int(readLine()!)!)
}
var idx = 0
for i in 1...n {
    stack.append(i)
    answer.append("+")
    while !stack.isEmpty && stack.last! == input[idx] {
        stack.popLast()
        answer.append("-")
        idx += 1
    }
}
if !stack.isEmpty {
    print("NO")
} else {
    for c in answer {
        print(c)
    }
}
