import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parents: [Int] = (0..<n).map { $0 }
    let costs = costs.sorted(by: { $0[2] < $1[2] })
    var result = 0
    
    func find(_ start: Int) -> Int{
        if parents[start] == start {
            return start
        }
        parents[start] = find(parents[start])
        return parents[start]
    }
    
    func union(_ start: Int, _ end: Int) {
        var startParent = find(start)
        var endParent = find(end)
        if startParent != endParent {
            parents[endParent] = startParent
        }
    }
    
    for cost in costs {
        let start = cost[0]
        let end = cost[1]
        if find(start) != find(end) {
            union(start, end)
            result += cost[2]
        }
    }

    return result
}

print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))