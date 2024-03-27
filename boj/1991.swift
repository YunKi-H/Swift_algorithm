// https://www.acmicpc.net/problem/1991

let n = Int(readLine()!)!
var tree: [String: [String]] = [:]
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    let node = input[0]
    let left = input[1]
    let right = input[2]
    tree[node] = [left, right]
}
var preOrder = ""
var inOrder = ""
var postOrder = ""
func pre_(_ node: String) {
    if node == "." { return }
    preOrder += node
    pre_(tree[node]![0])
    pre_(tree[node]![1])
}
func in_(_ node: String) {
    if node == "." { return }
    in_(tree[node]![0])
    inOrder += node
    in_(tree[node]![1])
}
func post_(_ node: String) {
    if node == "." { return }
    post_(tree[node]![0])
    post_(tree[node]![1])
    postOrder += node
}
pre_("A")
in_("A")
post_("A")
print(preOrder)
print(inOrder)
print(postOrder)