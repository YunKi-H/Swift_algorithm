// https://www.acmicpc.net/problem/2438

var n = Int(readLine()!)
if let i = n {
    for k in 1...i {
        for _ in 1...k {
            print("*", terminator: "")
        }
        print("")
    }
}
