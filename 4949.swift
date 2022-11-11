// https://www.acmicpc.net/problem/4949

while true {
    let str = readLine()!
    if str == "." {
        break
    }
    var arr: [Character] = Array()
    var isBalanced: Bool = true
    for c in str {
        switch c {
        case "(":
            arr.append("(")
        case ")":
            if arr.isEmpty || arr.last != "(" {
                isBalanced = false
                break
            } else {
                arr.removeLast()
            }
        case "[":
            arr.append("[")
        case "]":
            if arr.isEmpty || arr.last != "[" {
                isBalanced = false
                break
            } else {
                arr.removeLast()
            }
        default:
            continue
        }
    }
	if !arr.isEmpty {
		isBalanced = false
	}
    print(isBalanced ? "yes" : "no")
}
