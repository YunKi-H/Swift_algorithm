import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var map: [[Int]] = Array(repeating: [], count: n + 1)
    for road in roads {
        map[road[0]].append(road[1])
        map[road[1]].append(road[0])
    }

    var visited = Array(repeating: -1, count: n + 1)
    visited[destination] = 0
    var queue = [destination]
    var index = 0
    while queue.count > index {
        let current = queue[index]
        for next in map[current] {
            guard visited[next] == -1 else { continue }
            visited[next] = visited[current] + 1
            queue.append(next)
        }
        index += 1
    }
    return sources.map { visited[$0] }
}