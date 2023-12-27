// https://www.acmicpc.net/problem/18870

// import Foundation

// let n = Int(readLine()!)!
// var arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

// var sortedArr = Array(Set<Int>(arr)).sorted()

// var answer = ""
// for p in arr {
//     answer += "\(sortedArr.firstIndex(of: p)!) "
// }
// answer.removeLast()
// print(answer)

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dict = [Int:Int]()
var next = 0
for i in arr.sorted() {
    if dict[i] == nil {
        dict[i] = next
        next += 1
    }
}
print("\(arr.map{ String(dict[$0]!) }.joined(separator: " "))")