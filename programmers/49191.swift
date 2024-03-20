import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    var win: [[Int]] = Array(repeating: [], count: n + 1)
    var lose: [[Int]] = Array(repeating: [], count: n + 1)
    for result in results {
        win[result[0]].append(result[1])
        lose[result[1]].append(result[0])
    }
    for start in 1...n {
        var wvisited = Array(repeating: false, count: n + 1)
        var winStack = [start]
        var winned = 0
        wvisited[start] = true
        while !winStack.isEmpty {
            let current = winStack.removeLast()
            for next in win[current] {
                if wvisited[next] { continue }
                wvisited[next] = true
                winStack.append(next)
                winned += 1
            }
        }

        var lvisited = Array(repeating: false, count: n + 1)
        var loseStack = [start]
        var losed = 0
        lvisited[start] = true
        while !loseStack.isEmpty {
            let current = loseStack.removeLast()
            for next in lose[current] {
                if lvisited[next] { continue }
                lvisited[next] = true
                loseStack.append(next)
                losed += 1
            }
        }
        
        if winned + losed == n - 1 { answer += 1 }
    }
    return answer
}