import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var count = 0
    for start in 0..<n {
        if visited[start] { continue }
        visited[start] = true
        count += 1
        
        var stack = [start]
        while !stack.isEmpty {
            let now = stack.popLast()!
            for next in 0..<n where computers[now][next] > 0 {
                if visited[next] { continue }
                visited[next] = true
                stack.append(next)
            }
        }
    }
    return count
}