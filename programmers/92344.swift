import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let n = board.count
    let m = board[0].count
    var sumBoard = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    for s in skill {
        let (r1, c1, r2, c2) = (s[1], s[2], s[3], s[4])
        let d = s[0] == 1 ? s[5] : -s[5]
        sumBoard[r1][c1] -= d
        sumBoard[r1][c2 + 1] += d
        sumBoard[r2 + 1][c1] += d
        sumBoard[r2 + 1][c2 + 1] -= d
    }

    for x in 1...n {
        for y in 0...m {
            sumBoard[x][y] += sumBoard[x - 1][y]
        }
    }
    for y in 1...m {
        for x in 0...n {
            sumBoard[x][y] += sumBoard[x][y - 1]
        }
    }
    
    var answer = 0
    for x in 0..<n {
        for y in 0..<m {
            if board[x][y] + sumBoard[x][y] > 0 { answer += 1}
        }
    }
    return answer
}