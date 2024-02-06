import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var i = 0
    var n = n
    var immune = Heap<Int>(sort: <)
    while i < enemy.count {
        if immune.count < k {
            immune.insert(enemy[i])
            i += 1
            continue
        }
        if enemy[i] > immune.top {
            n -= immune.pop()
            if n < 0 { return i }
            immune.insert(enemy[i])
        } else {
            n -= enemy[i]
            if n < 0 { return i }
        }
        i += 1
    }
    return i
}

struct Heap<T: Comparable> { 
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var top: T {
        return nodes[0]
    }
    
    var count: Int {
        return nodes.count
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0 && sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func pop() -> T {
        
        nodes.swapAt(0, nodes.count-1)
        let poped = nodes.removeLast()
        var index = 0

        // 자식이 있는 인덱스만
        while index * 2 + 1 < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            // 왼쪽 오른쪽 자식 둘다 있는경우 -> 둘중 크고 부모보다 크면 스왑
            if rightChild < nodes.count {
                let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
                
                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else {
                    break
                }
                
            // 왼쪽 자식만 있는경우 -> 부모보다 크면 스왑
            } else { 
                if sort(nodes[leftChild], nodes[index]) {
                    nodes.swapAt(leftChild, index)
                    index = leftChild
                } else {
                    break
                }
            }
        }
        return poped
    }
}