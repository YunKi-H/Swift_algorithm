import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var arr = [k]
    var k = k
    while k > 1 {
        if k % 2 == 0 { k /= 2 }
        else { k = k * 3 + 1 }
        arr.append(k)
    }
    let n = arr.count

    var answer: [Double] = []
    for range in ranges {
        let a = range[0]
        let b = n + range[1]
        guard a < b else {
            answer.append(-1)
            continue
        }
        var size: Double = 0
        for d in a..<(b - 1) {
            let da = Double(arr[d])
            let db = Double(arr[d + 1])
            size += min(da, db) + abs(da - db) / 2
        }
        answer.append(size)
    }
    return answer
}

print(solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]))