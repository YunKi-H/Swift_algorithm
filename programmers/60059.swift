import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count
    var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n + m + m - 2), count: n + m + m - 2)
    for i in 0..<n {
        for j in 0..<n {
            board[i + m - 1][j + m - 1] = lock[i][j]
        }
    }
    func isOpened() -> Bool {
        for i in 0..<n {
            for j in 0..<n {
                guard board[i + m - 1][j + m - 1] == 1 else { return false }
            }
        }
        return true
    }
    if isOpened() { return true }
    
    func turnKey() {
        var newKey = key
        for i in 0..<m {
            for j in 0..<m {
                newKey[i][j] = key[j][m - i - 1]
            }
        }
        key = newKey
    }
    for turn in 0..<4 {
        for i in 0..<n + m - 1 {
            for j in 0..<n + m - 1 {
                for x in 0..<m {
                    for y in 0..<m {
                        board[x + i][y + j] += key[x][y]
                    }
                }
                if isOpened() { return true }
                for x in 0..<m {
                    for y in 0..<m {
                        board[x + i][y + j] -= key[x][y]
                    }
                }
            }
        }
        turnKey()
    }
    return false
}