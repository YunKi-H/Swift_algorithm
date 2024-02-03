import Foundation

func solution(_ grid:[String]) -> [Int] {
    var results: [Int] = []
    // 하 우 상 좌
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    let grid = grid.map { $0.map {String($0)} }
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: grid[0].count), count: grid.count)
    
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            for d in 0..<4 {
                if visited[i][j][d] { continue }
                
                let startNode: (Int, Int, Int) = (i, j, d)
                var current = startNode
                var len = 0
                while true {
                    if visited[current.0][current.1][current.2] { break }
                    visited[current.0][current.1][current.2] = true
                    len += 1
                    
                    let route = grid[current.0][current.1]
                    let nd = route == "L" ? (current.2 + 1) % 4 : route == "R" ? (current.2 + 3) % 4 : current.2
                    let nx = (current.0 + dx[nd] + grid.count) % grid.count
                    let ny = (current.1 + dy[nd] + grid[0].count) % grid[0].count
                    
                    current = (nx, ny, nd)
                    if current == startNode && len > 0 {
                        results.append(len)
                        break
                    }
                }
            }
        }
    }
    return results.sorted()
}