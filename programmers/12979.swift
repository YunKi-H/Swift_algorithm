import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var last = 0
    var range = 2 * w + 1
    for station in stations {
        let left = station - w
        let empty = left - last - 1
        last = station + w
        guard empty > 0 else { continue }
        answer += empty / range
        answer += empty % range > 0 ? 1 : 0
    }
    if last < n {
        let empty = n - last
        answer += empty / range
        answer += empty % range > 0 ? 1 : 0
    }
    return answer
}