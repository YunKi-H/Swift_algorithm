import Foundation

func solution(_ board:[String]) -> Int {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    var board = board.map { $0.map { String($0) } }
    let w = board[0].count
    let h = board.count
    var visited = Array(repeating: Array(repeating: -1, count: w), count: h)
    var goal: (Int, Int) = (0, 0)
    
    var queue: [(Int, Int)] = .init()
    for i in 0..<h {
        for j in 0..<w {
            if board[i][j] == "R" {
                visited[i][j] = 0
                queue.append((i, j))
            }
            if board[i][j] == "G" { goal = (i, j) }
        }
    }
    
    var index = 0
    while queue.count > index {
        let (nowX, nowY) = queue[index]
        for d in 0..<4 {
            var (newX, newY) = (nowX, nowY)
            while true {
                guard newX + dx[d] >= 0 && newX + dx[d] < h else { break }
                guard newY + dy[d] >= 0 && newY + dy[d] < w else { break }
                guard board[newX + dx[d]][newY + dy[d]] != "D" else { break }
                
                newX += dx[d]
                newY += dy[d]
            }
            guard visited[newX][newY] == -1 else { continue }
            visited[newX][newY] = visited[nowX][nowY] + 1
            queue.append((newX, newY))
        }
        
        index += 1
    }
    return visited[goal.0][goal.1]
}