import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    var costs: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    costs[0][0] = 0
    
    func dfs(_ x: Int, _ y: Int, _ direction: Int, _ cost: Int) {
        guard 0..<n ~= x else { return }
        guard 0..<n ~= y else { return }
        guard board[x][y] == 0 else { return }
        guard cost <= costs[x][y] else { return }
        costs[x][y] = cost
        
        for d in 0..<4 {
            let newX = x + dx[d]
            let newY = y + dy[d]
            guard 0..<n ~= newX else { continue }
            guard 0..<n ~= newY else { continue }
            
            if d == direction {
                dfs(newX, newY, d, cost + 100)
            } else {
                dfs(newX, newY, d, cost + 600)
            }
        }
    }
    
    for d in 0..<4 {
        dfs(dx[d], dy[d], d, 100)
    }
    
    return costs[n - 1][n - 1]
}

print(solution([[0,0,0],[0,0,0],[0,0,0]]))