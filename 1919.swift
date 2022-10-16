// https://www.acmicpc.net/problem/1919
var word1: [Int] = Array(repeating: 0, count: 26)
var word2: [Int] = Array(repeating: 0, count: 26)

let words1 = readLine()!
let words2 = readLine()!

for c in words1 {
    word1[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] += 1
}
for c in words2 {
    word2[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] += 1
}
var answer: Int = 0
for i in 0..<26 {
    answer += abs(word1[i] - word2[i])
}
print(answer)
