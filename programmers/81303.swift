import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var str = Array(repeating: "O", count: n)
    var removed: [Int] = []
    var k = k
    for c in cmd {
        switch c.first! {
        case "U":
            let command = c.split { $0 == " " }.map { String($0) }
            var i = 0
            let d = Int(command[1]) ?? 0
            while i < d {
                k -= 1
                if str[k] == "X" { continue }
                i += 1
            }
        case "D":
            let command = c.split { $0 == " " }.map { String($0) }
            var i = 0
            let d = Int(command[1]) ?? 0
            while i < d {
                k += 1
                if str[k] == "X" { continue }
                i += 1
            }
        case "C":
            str[k] = "X"
            removed.append(k)
            let tmp = k - 1
            while k < n && str[k] == "X" { k += 1 }
            if k == n {
                k = tmp
                while k > 0 && str[k] == "X" { k -= 1 }
            }
        case "Z":
            let restored = removed.removeLast()
            str[restored] = "O"
        default:
            break
        }
    }
    
    return str.joined()
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))