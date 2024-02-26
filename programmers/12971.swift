import Foundation

func solution(_ sticker:[Int]) -> Int{
    guard sticker.count > 2 else { return sticker.max()! }
    let arr0 = Array(sticker[0..<sticker.count-1])
    var dp0: [Int] = Array(repeating: 0, count: sticker.count - 1)
    dp0[0] = arr0[0]
    dp0[1] = arr0[1]
    for i in 2..<arr0.count {
        dp0[i] = max(dp0[i - 1], dp0[i - 2] + arr0[i])
        if i > 2 {
            dp0[i] = max(dp0[i], dp0[i - 3] + arr0[i])
        }
    }
    
    let arr1 = Array(sticker[1...])
    var dp1: [Int] = Array(repeating: 0, count: sticker.count - 1)
    dp1[0] = arr1[0]
    dp1[1] = arr1[1]
    for i in 2..<arr1.count {
        dp1[i] = max(dp1[i - 1], dp1[i - 2] + arr1[i])
        if i > 2 {
            dp1[i] = max(dp1[i], dp1[i - 3] + arr1[i])
        }
    }

    return max(dp0.last!, dp1.last!)
}