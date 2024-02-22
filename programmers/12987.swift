import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let arr = a.sorted()
    let brr = b.sorted()
    var count = 0
    var i = 0, j = 0
    while i < arr.count && j < brr.count {
        if arr[i] < brr[j] {
            i += 1
            j += 1
            count += 1
        } else if arr[i] >= brr[i] {
            j += 1
        }
    }
    return count
}