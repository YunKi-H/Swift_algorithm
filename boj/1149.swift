// https://www.acmicpc.net/problem/1149

let n = Int(readLine()!)!
var cost: [[Int]] = [[]]
for _ in 0..<n {
    cost.append(readLine()!.split { $0 == " " }.map { Int(String($0))! })
}
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: n + 1)
for i in 1...n {
    dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + cost[i][0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + cost[i][1]
    dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + cost[i][2]
}
print(min(dp[n][0], dp[n][1], dp[n][2]))