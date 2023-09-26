// https://www.acmicpc.net/problem/1012

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let MNK = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var map = Array(repeating: Array(repeating: 0, count: MNK[0]), count: MNK[1])
    var count = 0

    for _ in 0..<MNK[2] {
        let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
        map[xy[1]][xy[0]] = 1
    }

    for y in 0..<MNK[1] {
        for x in 0..<MNK[0] {
            if map[y][x] == 1 {
                count += 1
                bfs(x, y, &map, MNK[0], MNK[1])
            }
        }
    }
    print(count)
}

func bfs(_ x: Int, _ y: Int, _ map: inout [[Int]], _ m: Int, _ n: Int) {
    guard x >= 0 && x < m && y >= 0 && y < n && map[y][x] == 1 else {
        return
    }
    map[y][x] = 0
    bfs(x + 1, y, &map, m, n)
    bfs(x - 1, y, &map, m, n)
    bfs(x, y + 1, &map, m, n)
    bfs(x, y - 1, &map, m, n)
}
