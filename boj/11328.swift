// https://www.acmicpc.net/problem/11328
let n: Int = Int(readLine()!)!
for _ in 1...n {
    var arr: [Int] = Array(repeating: 0, count: 26)
    let strings = readLine()!.split(separator: " ")
    for c in strings[0] {
        arr[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] += 1
    }
    for c in strings[1] {
        arr[Int(c.asciiValue!) - Int(Character("a").asciiValue!)] -= 1
    }
    var isPossible: Bool = true
    for i in arr {
        if i != 0 {
            isPossible = false
        }
    }
    print(isPossible ? "Possible" : "Impossible")
}
