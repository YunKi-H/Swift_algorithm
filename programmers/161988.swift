import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    var dp1 = Array(repeating: 0, count: sequence.count) // 1 -1
    var dp2 = Array(repeating: 0, count: sequence.count) // -1 1
    dp1[0] = max(0, sequence[0])
    dp2[0] = max(0, -sequence[0])
    for i in 1..<sequence.count {
        dp1[i] = max(0, dp1[i - 1] + sequence[i] * (i % 2 == 0 ? 1 : -1))
        dp2[i] = max(0, dp2[i - 1] + sequence[i] * (i % 2 == 0 ? -1 : 1))
    }
    
    return Int64(max(dp1.max()!, dp2.max()!))
}