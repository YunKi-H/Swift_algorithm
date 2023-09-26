// https://www.acmicpc.net/problem/2504

let str = Array(readLine()!)
var isValid: Bool = true
var stk: [Int] = []
for i in 0..<str.count {
    switch str[i] {
    case "(":
        stk.append(0)
    case "[":
        stk.append(1)
    case ")":
        var tmp = 0
        if stk.isEmpty {
            isValid = false
            break
        } else if stk.last == 0 {
            stk.removeLast()
            stk.append(2)
        } else {
            while !stk.isEmpty && stk.last! >= 2 {
                tmp += stk.last!
                stk.removeLast()
            }
            if stk.isEmpty || stk.last! != 0 {
                isValid = false
                break
            } else {
                stk.removeLast()
                stk.append(tmp * 2)
            }
        }
    case "]":
        var tmp = 0
        if stk.isEmpty {
            isValid = false
            break
        } else if stk.last == 1 {
            stk.removeLast()
            stk.append(3)
        } else {
            while !stk.isEmpty && stk.last! >= 2 {
                tmp += stk.last!
                stk.removeLast()
            }
            if stk.isEmpty || stk.last! != 1 {
                isValid = false
                break
            } else {
                stk.removeLast()
                stk.append(tmp * 3)
            }
        }
    default:
        continue
    }
}
if isValid {
    var res = 0;
    while !stk.isEmpty {
        if stk.last! < 2 {
            res = 0
            break
        }
        res += stk.popLast()!
    }
    print(res)
} else {
    print(0)
}
