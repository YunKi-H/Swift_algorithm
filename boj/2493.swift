// https://www.acmicpc.net/problem/2493

let n = Int(readLine()!)!
let tower = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }

var stack: [[Int]] = []
for i in 0..<n {
    if !stack.isEmpty {
        while !stack.isEmpty && stack.last![1] < tower[i] {
            stack.popLast()
        }
    }
    if stack.isEmpty {
        print("0", terminator: " ")
        stack.append([i, tower[i]])
        continue
    }
    print(stack.last![0] + 1, terminator: " ")
    stack.append([i, tower[i]])
}
