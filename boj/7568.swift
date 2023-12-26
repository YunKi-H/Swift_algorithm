// https://www.acmicpc.net/problem/7568

import Foundation

let n = Int(readLine()!)!
var peoples: [(Int, Int)] = []
var ranks: [Int] = []

for _ in 0..<n {
  let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
  let person = (xy[0], xy[1])
  var rank = 1
  for i in 0..<ranks.count {
    if peoples[i].0 > person.0 && peoples[i].1 > person.1 {
      rank += 1
    } else if peoples[i].0 < person.0 && peoples[i].1 < person.1 {
      ranks[i] += 1
    }
  }
  peoples.append(person)
  ranks.append(rank)
}

var answer = ""
for rank in ranks {
  answer += "\(rank) "
}
answer.removeLast()
print(answer)