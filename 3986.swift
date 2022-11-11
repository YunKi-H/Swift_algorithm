// https://www.acmicpc.net/problem/3986

let n = Int(readLine()!)!
var goodWord = 0
for _ in 0..<n {
    var arr: [Character] = []
    let word = readLine()!
    for c in word {
        switch c {
        case "A":
            if arr.last == "A" {
                arr.removeLast()
            } else {
                arr.append("A")
            }
        default:
            if arr.last == "B" {
                arr.removeLast()
            } else {
                arr.append("B")
            }
        }
    }
    if arr.isEmpty {
        goodWord += 1
    }
}
print(goodWord)
