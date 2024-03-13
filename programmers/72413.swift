import Foundation

func solution(_ n:Int, _ start:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var costs: [[Int]] = Array(repeating: Array(repeating: 100000 * n, count: n + 1), count: n + 1)
    for i in 1...n {
        costs[i][i] = 0
    }
    for fare in fares {
        costs[fare[0]][fare[1]] = fare[2]
        costs[fare[1]][fare[0]] = fare[2]
    }
    
    for m in 1...n {
        for s in 1...n {
            for e in 1...n {
                if costs[s][e] > costs[s][m] + costs[m][e] {
                    costs[s][e] = costs[s][m] + costs[m][e]
                }
            }
        }
    }
    var answer = Int.max
    for c in 1...n {
        answer = min(answer, costs[start][c] + costs[c][a] + costs[c][b])
    }
    return answer
}

print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))