import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 1
    var a = a
    var b = b
    while (a + 1) / 2 != (b + 1) / 2 {
        a = (a + 1) / 2
        b = (b + 1) / 2
        answer += 1
    }

    return answer
}