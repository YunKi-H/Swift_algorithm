import Foundation

func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {
    var count = 0
    var n = n
    let left: Int = Int(l)
    let right: Int = Int(r)
    
    func check(_ i: Int) -> Bool {
        if i < 5 && i % 5 != 2 { return true }
        if i % 5 == 2 { return false }
        
        return check(i / 5)
    }
    
    for i in (left-1)..<right {
        if check(i) { count += 1 }
    }
    
    return count
}