// https://www.acmicpc.net/problem/10026

import Foundation

let N = Int(readLine()!)!
var map: [[Character]] = []
var RGB: Int = 0
var RB: Int = 0

for _ in 0..<N {
    map.append(Array(readLine()!))
}

for y in 0..<N {
    for x in 0..<N {
        switch map[y][x] {
        case "R":
            dfs(x, y, "r", "R")
        case "G":
            dfs(x, y, "r", "G")
        case "B":
            dfs(x, y, "b", "B")
        default:
            continue
        }
        RGB += 1
    }
}

for y in 0..<N {
    for x in 0..<N {
        switch map[y][x] {
        case "r":
            dfs(x, y, "a", "r")
        case "b":
            dfs(x, y, "a", "b")
        default:
            continue
        }
        RB += 1
    }
}

print(RGB, RB)

func dfs(_ x: Int, _ y: Int, _ mark: Character, _ c: Character) {
    guard x >= 0 && x < N && y >= 0 && y < N && map[y][x] == c else {
        return
    }

    map[y][x] = mark

    dfs(x + 1, y, mark, c)
    dfs(x - 1, y, mark, c)
    dfs(x, y + 1, mark, c)
    dfs(x, y - 1, mark, c)
}
