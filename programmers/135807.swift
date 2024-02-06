import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    func gcd(_ a: Int, _ b: Int) -> Int {
        if a > b {
            if b == 0 { return a }
            return gcd(b, a % b)
        } else {
            if a == 0 { return b }
            return gcd(a, b % a)
        }
    }
    let gcdA = arrayA.reduce(into: arrayA.first!) { $0 = gcd($0, $1) }
    let gcdB = arrayB.reduce(into: arrayB.first!) { $0 = gcd($0, $1) }
    guard arrayA.filter { $0 % gcdB == 0 }.count == 0 || arrayB.filter { $0 % gcdA == 0 }.count == 0 else { return 0 }
    return max(gcdA, gcdB)
}