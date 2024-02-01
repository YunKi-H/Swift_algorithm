import Foundation

func solution(_ maps:[String]) -> Int {
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    let board = maps.map { $0.map {String($0)} }
    let h = board.count
    let w = board[0].count
    var visited = Array(repeating: Array(repeating: -1, count: w), count: h)
    var start = (0, 0)
    var lever = (0, 0)
    var exit = (0, 0)
    for i in 0..<h {
        for j in 0..<w {
            if board[i][j] == "S" { start = (i, j) }
            if board[i][j] == "L" { lever = (i, j) }
            if board[i][j] == "E" { exit = (i, j) }
        }
    }
    
    var queue: [(Int, Int)] = [start]
    var idx = 0
    visited[start.0][start.1] = 0
    while queue.count > idx {
        let nowNode = queue[idx]
        for d in 0..<4 {
            let newNode = (nowNode.0 + dx[d], nowNode.1 + dy[d])
            guard newNode.0 >= 0 && newNode.0 < h else { continue }
            guard newNode.1 >= 0 && newNode.1 < w else { continue }
            guard board[newNode.0][newNode.1] != "X" else { continue }
            guard visited[newNode.0][newNode.1] == -1 else { continue }
            visited[newNode.0][newNode.1] = visited[nowNode.0][nowNode.1] + 1
            queue.append(newNode)
        }
        idx += 1
    }
    
    let leverCount = visited[lever.0][lever.1]
    if leverCount == -1 { return -1 }
    visited = Array(repeating: Array(repeating: -1, count: w), count: h)
    visited[lever.0][lever.1] = leverCount
    queue = [lever]
    idx = 0
    while queue.count > idx {
        let nowNode = queue[idx]
        for d in 0..<4 {
            let newNode = (nowNode.0 + dx[d], nowNode.1 + dy[d])
            guard newNode.0 >= 0 && newNode.0 < h else { continue }
            guard newNode.1 >= 0 && newNode.1 < w else { continue }
            guard board[newNode.0][newNode.1] != "X" else { continue }
            guard visited[newNode.0][newNode.1] == -1 else { continue }
            visited[newNode.0][newNode.1] = visited[nowNode.0][nowNode.1] + 1
            queue.append(newNode)
        }
        idx += 1
    }
    print(visited)
    return visited[exit.0][exit.1]
}