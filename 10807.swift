// https://www.acmicpc.net/problem/10807
let n: Int = Int(readLine()!)!
let arr: [Int] = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }
    .sorted()
let v: Int = Int(readLine()!)!
if arr.contains(v) {
    print(arr.lastIndex(of: v)! - arr.firstIndex(of: v)! + 1)
} else {
    print(0)
}

// *arr.filter{ $0 == v }.count
