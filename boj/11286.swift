// https://www.acmicpc.net/problem/11286

// import Foundation

// let n = Int(readLine()!)!
// var queue: [Int] = []
// var answer = ""
// for _ in 0..<n {
//   let x = Int(readLine()!)!
//   if x == 0 {
//     if queue.isEmpty { answer += "0\n" }
//     else {
//       var min = Int.max
//       var minIdx = 0
//       for i in 0..<queue.count {
//         let absI = queue[i] > 0 ? queue[i] : -queue[i]
//         let absM = min > 0 ? min : -min
//         if absI < absM {
//           min = queue[i]
//           minIdx = i
//         } else if absI == absM && queue[i] < min {
//           min = queue[i]
//           minIdx = i
//         }
//       }
//       answer += "\(min == Int.max ? 0 : min)\n"
//       queue[minIdx] = Int.max
//     }
//   } else {
//     queue.append(x)
//   }
// }

import Foundation

class Heap<T> {
    private var nodes: [T] = []
    private let compare: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.compare = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    func insert(_ element: T) {
        var idx = nodes.count
        nodes.append(element)
        
        while idx > 0, compare(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
        }
    }
    
    func delete() -> T? {
        guard nodes.isEmpty == false else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let target = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        
        var idx = 0
        let limit = nodes.count
        
        while idx < limit {
            let leftChild = idx * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
                    .filter{$0 < limit && compare(nodes[$0], nodes[idx])}
                    .sorted {compare(nodes[$0], nodes[$1])}
                                
            if children.isEmpty { break }
            
            nodes.swapAt(idx, children[0])
            idx = children[0]
        }
        
        return target
    }
}
let heap = Heap<Int> {
    if abs($0) < abs($1) {
        return true
    } else if abs($0) == abs($1) {
        return $0 < $1
    } else {
        return false
    }
}

let n = Int(readLine()!)!
var ans = ""

for _ in 0..<n {
    let cmd = Int(readLine()!)!
    
    if cmd == 0 {
        ans += "\(heap.delete() ?? 0)\n"
    } else {
        heap.insert(cmd)
    }
}
print(ans.dropLast())