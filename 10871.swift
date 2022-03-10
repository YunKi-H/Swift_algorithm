// https://www.acmicpc.net/source/29497883

import Foundation

let nx = readLine()!.split(separator: " ").map({Int($0)})
let arr = readLine()!.split(separator: " ").map({Int($0)})
var answer = ""
for i in arr{
    if i! < nx[1]! {
        answer += "\(i!) "
    }
}
print(answer.dropLast())
