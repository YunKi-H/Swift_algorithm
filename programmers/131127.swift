import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var count = 0
    var dict: [String: Int] = .init()
    for i in 0..<want.count {
        dict[want[i]] = number[i]
    }
    var len = number.reduce(0, +)
    for i in 0...discount.count-len {
        var newDict: [String: Int] = .init()
        for item in discount[i..<i+len] {
            newDict[item, default: 0] += 1
        }
        if dict == newDict { count += 1}
    }
    return count
}