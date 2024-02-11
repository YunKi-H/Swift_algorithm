import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var answer = Int.max
    for cutted in wires {
        var graph: [[Int]] = Array(repeating: [], count: n + 1)
        for wire in wires {
            if wire == cutted { continue }
            graph[wire[0]].append(wire[1])
            graph[wire[1]].append(wire[0])
        }
        var visited = Array(repeating: false, count: n + 1)
        
        var stack = [1]
        var count = 0
        visited[1] = true
        while !stack.isEmpty {
            let current = stack.last!
            visited[current] = true
            stack.removeLast()
            count += 1
            for next in graph[current] {
                if visited[next] { continue }
                stack.append(next)
            }
        }
        let other = n - count
        answer = min(answer, abs(count - other))
    }
    return answer
}