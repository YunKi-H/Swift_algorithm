import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var graph: [[Int]] = .init(repeating: [], count: info.count)
    for edge in edges {
        graph[edge[0]].append(edge[1])
    }
    var answer = 0
    var visited: [Bool] = .init(repeating: false, count: info.count)
    
    func backtracking(_ node: Int, _ nextNodes: [Int], _ sheep: Int, _ wolf: Int) {
        if visited[node] { return }
        var (s, w) = (sheep, wolf)
        if info[node] == 0 { s += 1 }
        else { w += 1 }
        guard s > w else { return }
        answer = max(s, answer)
        var nextNodes = nextNodes.filter { $0 != node } + graph[node]
        for nextNode in nextNodes {
            backtracking(nextNode, nextNodes, s, w)
        }
    }
    backtracking(0, [], 0, 0)

    return answer
}