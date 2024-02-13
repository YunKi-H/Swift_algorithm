import Foundation

func solution(_ c:[Int]) -> Int {
    let cards = c.map { $0 - 1 }
    var visited: [Bool] = Array(repeating: false, count: cards.count)
    var roops: [[Int]] = []
    
    for start in 0..<cards.count {
        if visited[start] { continue }
        visited[start] = true
        var current = cards[start]
        var roop: [Int] = [start]
        while current != start {
            roop.append(current)
            visited[current] = true
            current = cards[current]
        }
        roops.append(roop)
    }
    
    if roops.count == 1 { return 0 }
    roops.sort { $0.count > $1.count }
    return roops[0].count * roops[1].count
}