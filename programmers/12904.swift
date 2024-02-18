import Foundation

func solution(_ s:String) -> Int {
    let str = s.map{ String($0) }
    var answer = 1
    for i in 0..<str.count {
        for j in stride(from: str.count - 1, through: i, by: -1) {
            let length = j - i + 1
            if length <= answer { continue }
            var left = i
            var right = j
            while left <= right && str[left] == str[right] {
                left += 1
                right -= 1
            }
            if left > right { answer = max(answer, length) }
        }
    }
    return answer
}