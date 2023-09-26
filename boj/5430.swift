// https://www.acmicpc.net/problem/5430

let t = Int(readLine()!)!

for _ in 1...t {
    let p = readLine()!
    let n = Int(readLine()!)!
    let arr: Array = readLine()!
        .dropLast()
        .dropFirst()
        .split(separator: ",")
        .map{ Int(String($0))! }
    var rev = false
    var err = false
    var head = 0
    var tail = n - 1
    for c in p {
        switch c {
        case "R":
            rev.toggle()
        case "D":
            if head > tail {
                err = true
                break
            }
            if rev {
                tail -= 1
            } else {
                head += 1
            }
        default:
            continue
        }
    }
    if err {
        print("error")
    } else if head > tail {
        print("[]")
    } else {
        var ans: String
        if rev {
            ans = arr[head...tail].map{ String($0) }.reversed().joined(separator: ",")
        } else {
            ans = arr[head...tail].map{ String($0) }.joined(separator: ",")
        }
        print("[" + ans + "]")
    }
}
