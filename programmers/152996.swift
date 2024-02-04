import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var count = 0
    var weightCount: [Int] = Array(repeating: 0, count: 2001)
    for weight in weights {
        weightCount[weight] += 1
    }
    for w in 100...1000 {
        count += (weightCount[w] * (weightCount[w] - 1)) / 2
        
        if w % 2 == 0 {
            count += weightCount[w] * weightCount[w / 2 * 3]
        }
        
        if w % 3 == 0 {
            count += weightCount[w] * weightCount[w / 3 * 4]
        }
        
        count += weightCount[w] * weightCount[w * 2]
    }
    return Int64(count)
}