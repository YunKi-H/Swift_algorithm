import Foundation

func solution(_ a:[Int]) -> Int {
    let m = a.min()!
    var count = 1
    var left = 0
    var leftMin = a[left]
    while a[left] != m {
        if a[left] <= leftMin {
            leftMin = a[left]
            count += 1
        }
        left += 1
    }
    var right = a.count - 1
    var rightMin = a[right]
    while a[right] != m {
        if a[right] <= rightMin {
            rightMin = a[right]
            count += 1
        }
        right -= 1
    }
    return count
}