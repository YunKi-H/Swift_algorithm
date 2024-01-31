import Foundation

func solution(_ order:[Int]) -> Int {
    var boxes = (1...order.count).reversed().map {$0}
    var belt: [Int] = []
    var count = 0
    for box in order {
        if !boxes.isEmpty && boxes.last! == box {
            boxes.removeLast()
            count += 1
        } else if !belt.isEmpty && belt.last! == box {
            belt.removeLast()
            count += 1
        } else {
            while !boxes.isEmpty && boxes.last! != box {
                belt.append(boxes.last!)
                boxes.removeLast()
            }
            if boxes.isEmpty { break }
            else {
                boxes.removeLast()
                count += 1
            }
        }
    }
    return count
}