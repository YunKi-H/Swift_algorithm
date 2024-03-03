import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var visited = Array(repeating: -1, count: n + 1)
    for v in edge {
        graph[v[0]].append(v[1])
        graph[v[1]].append(v[0])
    }
    var queue = [1]
    visited[1] = 0
    var index = 0
    while index < queue.count {
        let current = queue[index]
        for next in graph[current] {
            guard visited[next] == -1 else { continue }
            visited[next] = visited[current] + 1
            queue.append(next)
        }
        index += 1
    }
    guard let max = visited.max() else { return -1 }
    return visited.filter { $0 == max }.count
}