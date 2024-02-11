import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let queue = queue1 + queue2
    var left = 0
    var right = queue1.count
    
    let sum1 = queue1.reduce(0, +)
    let sum2 = queue2.reduce(0, +)
    guard (sum1 + sum2) % 2 == 0 else { return -1 }
    let goal = (sum1 + sum2) / 2
    var sum = sum1
    var count = 0
    
    while left < right && right < queue.count {
        if sum < goal {
            sum += queue[right]
            right += 1
        } else if sum > goal {
            sum -= queue[left]
            left += 1
        } else {
            return count
        }
        count += 1
    }
    
    return -1
}