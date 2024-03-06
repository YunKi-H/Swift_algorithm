import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var deque: [Int] = []
    var start = 0
    var maxArr: [Int] = []
    for (i, stone) in stones.enumerated() {
        if deque.count > start && i - deque[start] == k {
            start += 1
        }
        while deque.count > start && stone > stones[deque.last!] {
            deque.removeLast()
        }
        deque.append(i)
        if i >= k - 1 {
            maxArr.append(stones[deque[start]])
        }
    }
    return maxArr.min()!
}