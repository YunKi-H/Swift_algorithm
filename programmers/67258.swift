import Foundation

func solution(_ gems:[String]) -> [Int] {
    let kind = Set<String>(gems).count
    var result: (start: Int, end: Int) = (0, gems.count)
    var dict: [String: Int] = [:]
    var left = 0
    var right = 0
    for i in 0..<gems.count {
        right = i
        dict[gems[right]] = i
        if gems[left] == gems[right] {
            left = dict.min(by: { $0.value < $1.value })?.value ?? 0
        }
        if dict.count == kind {
            result = result.end - result.start > right - left ? (left, right) : result
        }
    }
    return [result.start + 1, result.end + 1]
}