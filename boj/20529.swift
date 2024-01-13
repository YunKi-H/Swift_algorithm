// https://www.acmicpc.net/problem/20529

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  let arr = readLine()!.split { $0 == " " }.map { String($0).map { String($0) } }
  var gap = 8
  if arr.count > 48 {
    print(0)
    continue
  }

  comb(0, n, [])
  print(gap)

  func comb(_ index: Int, _ lastIndex: Int, _ selected: [Int] = []) {
    guard selected.count < 3 else {
      var sum = 0
      for i in 0..<4 {
        sum += arr[selected[0]][i] == arr[selected[1]][i] ? 0 : 1
        sum += arr[selected[1]][i] == arr[selected[2]][i] ? 0 : 1
        sum += arr[selected[2]][i] == arr[selected[0]][i] ? 0 : 1
      }
      gap = min(gap, sum)
      return
    }
    guard index < lastIndex else { return }

    var selected = selected
    for next in index ..< lastIndex {
      selected.append(next)
      comb(next + 1, lastIndex, selected)
      selected.removeLast()
    }
  }
}