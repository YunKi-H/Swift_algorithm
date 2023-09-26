// https://www.acmicpc.net/problem/1158

let nk = readLine()!
    .split(separator: " ")
    .map{ Int(String($0))! }

var arr = Array(1...nk[0])
var ans = String("<")
var idx = 0
while arr.count > 1 {
    idx += nk[1] - 1
    if idx >= arr.count {
        idx %= arr.count
    }
    ans += String(arr[idx]) + ", "
    arr.remove(at: idx)
}
ans += String(arr[0]) + ">"
print(ans)
