import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var arr: [[Int]] = []
    
    func combination(_ discounts: [Int]) {
        if discounts.count == emoticons.count {
            var result = [0, 0]
            for user in users {
                let rate = user[0]
                let price = user[1]
                var sum = 0
                for i in 0..<discounts.count {
                    if discounts[i] * 10 >= rate { sum += emoticons[i] / 10 * (10 - discounts[i]) }
                }
                if sum >= price { result[0] += 1 }
                else { result[1] += sum }
            }
            arr.append(result)
            return
        }
        for discount in 1...4 {
            combination(discounts + [discount])
        }
    }
    
    combination([])

    return arr.max {
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }!
}