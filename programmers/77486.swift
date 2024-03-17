import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    let n = enroll.count
    var answer: [Int] = Array(repeating: 0, count: n)
    
    var index: [String: Int] = [:]
    for i in 0..<n {
        index[enroll[i]] = i
    }
    
    var parents = (0..<n).map { $0 }
    for i in 0..<n {
        parents[i] = index[referral[i]] ?? i
    }
    
    func division(_ target: Int, _ money: Int) {
        let cut = money / 10
        if target == parents[target] {
            answer[target] += money - cut
            return
        }
        if money / 10 == 0 {
            answer[target] += money
            return
        }
        answer[target] += money - cut
        division(parents[target], cut)
    }
    
    for i in 0..<seller.count {
        division(index[seller[i]]!, amount[i] * 100)
    }
    return answer
}