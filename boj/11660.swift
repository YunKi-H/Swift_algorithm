// https://www.acmicpc.net/problem/11660

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var map: [[Int]] = [Array(repeating:0, count: n + 1)]
for _ in 0..<n {
    var array = [0] + readLine()!.split { $0 == " " }.map { Int(String($0))! }
    for i in 1...n {
        array[i] += array[i - 1]
    }
    map.append(array)
}
for i in 1...n {
    for j in 0...n {
        map[i][j] += map[i - 1][j]
    }
}
for _ in 0..<m {
    let point = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let (x1, y1, x2, y2) = (point[0], point[1], point[2], point[3])
    print(map[x2][y2] - map[x1 - 1][y2] - map[x2][y1 - 1] + map[x1 - 1][y1 - 1])
}
