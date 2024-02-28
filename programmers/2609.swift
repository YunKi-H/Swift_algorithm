import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    var answer: [String] = []
    var used: [Bool] = Array(repeating: false, count: tickets.count)
    var ticket = tickets.sorted(by: {
        if $0[0] == $1[0] {
            return $0[1] > $1[1]
        }
        return $0[0] > $1[0]
    })

    func backtrack(_ current: String, _ done: Int, _ arr: [String]) {
        if done == ticket.count {
            answer = arr
            return
        }
        for i in 0..<ticket.count where !used[i] && ticket[i][0] == current {
            used[i] = true
            backtrack(ticket[i][1], done + 1, arr + [ticket[i][1]])
            used[i] = false
        }
    }
    
    backtrack("ICN", 0, ["ICN"])
    return answer
}