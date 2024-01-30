import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> [Int] {
    let (l, r) = (Int(l), Int(r))
    let (row1, row2) = (l / n + 1, r / n + 1)
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: row2 - row1 + 1)
    for i in 0..<arr.count {
        for j in 0..<n {
            arr[i][j] = max(j + 1, row1 + i)
        }
    }
    let newL = l % n
    let newR = r - l + newL
    return arr.flatMap {$0}[newL...newR].map {$0}
}