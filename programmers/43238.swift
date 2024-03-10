import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    var left = 0
    var right = Int.max / 2
    while left < right {
        let mid = (left + right) / 2
        var sum = 0
        for time in times {
            sum += mid / time
            if sum > n { break }
        }
        if sum < n {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return Int64(left)
}

print(solution(8, [5, 7, 12]))