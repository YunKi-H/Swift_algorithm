import Foundation

func solution(_ line:[[Int]]) -> [String] {
    var starX: [Int] = []
    var starY: [Int] = []
    for i in 0..<(line.count - 1) {
        for j in (i + 1)..<line.count {
            let (a, b, e) = (line[i][0], line[i][1], line[i][2])
            let (c, d, f) = (line[j][0], line[j][1], line[j][2])
            let valid = a * d - b * c
            if valid == 0 { continue }
            guard (b * f - e * d) % (valid) == 0 else { continue }
            guard (e * c - a * f) % (valid) == 0 else { continue }
            starX.append((b * f - e * d) / (valid))
            starY.append((e * c - a * f) / (valid))
        }
    }
    let top = starY.max()!
    let bottom = starY.min()!
    let left = starX.min()!
    let right = starX.max()!
    var board = Array(repeating: Array(repeating: ".", count: right - left + 1), count: top - bottom + 1)
    for i in 0..<starX.count {
        board[starY[i] - bottom][starX[i] - left] = "*"
    }
    return board.map { $0.joined() }.reversed()
}