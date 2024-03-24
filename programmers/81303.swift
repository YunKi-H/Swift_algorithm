// import Foundation

// func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
//     var str = Array(repeating: "O", count: n)
//     var removed: [Int] = []
//     var k = k
//     for c in cmd {
//         switch c.first! {
//         case "U":
//             let command = c.split { $0 == " " }.map { String($0) }
//             var i = 0
//             let d = Int(command[1]) ?? 0
//             while i < d {
//                 k -= 1
//                 if str[k] == "X" { continue }
//                 i += 1
//             }
//         case "D":
//             let command = c.split { $0 == " " }.map { String($0) }
//             var i = 0
//             let d = Int(command[1]) ?? 0
//             while i < d {
//                 k += 1
//                 if str[k] == "X" { continue }
//                 i += 1
//             }
//         case "C":
//             str[k] = "X"
//             removed.append(k)
//             let tmp = k - 1
//             while k < n && str[k] == "X" { k += 1 }
//             if k == n {
//                 k = tmp
//                 while k > 0 && str[k] == "X" { k -= 1 }
//             }
//         case "Z":
//             let restored = removed.removeLast()
//             str[restored] = "O"
//         default:
//             break
//         }
//     }
    
//     return str.joined()
// }

import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    class Node {
        var index: Int
        var prev: Node?
        var next: Node?
        init(_ index: Int) {
            self.index = index
        }
    }
    
    var head: Node? = Node(0)
    var tail: Node? = head
    var current = head
    for i in 1..<n {
        var newNode: Node? = Node(i)
        if i == k { current = newNode}
        tail?.next = newNode
        newNode?.prev = tail
        tail = newNode
    }
    var removed: [Node?] = []
    for command in cmd {
        switch command.first! {
        case "U":
            let c = command.split { $0 == " " }.map { String($0) }
            let d = Int(c[1])!
            for i in 0..<d {
                current = current?.prev
            }
        case "D":
            let c = command.split { $0 == " " }.map { String($0) }
            let d = Int(c[1])!
            for i in 0..<d {
                current = current?.next
            }
        case "C":
            removed.append(current)
            if current?.prev == nil {
                head = current?.next
            }
            current?.next?.prev = current?.prev
            current?.prev?.next = current?.next
            current = current?.next ?? current?.prev
        case "Z":
            let restored = removed.removeLast()
            restored?.next?.prev = restored
            restored?.prev?.next = restored
            if restored?.prev == nil {
                head = restored
            }
        default:
            break
        }
    }
    var answer = ""
    for i in 0..<n {
        if head?.index != i {
            answer += "X"
            continue
        }
        answer += "O"
        head = head?.next
    }
    return answer
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))