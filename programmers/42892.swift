import Foundation

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    class Node {
        var index: Int
        var x: Int
        var y: Int
        var left: Node?
        var right: Node?
        init(_ index: Int, _ x: Int, _ y: Int) {
            self.index = index
            self.x = x
            self.y = y
        }
    }
    
    let info = nodeinfo.enumerated().sorted(by: {
        if $0.1[1] == $1.1[1] { return $0.1[0] < $1.1[0] }
        return $0.1[1] > $1.1[1]
    })

    let root: Node? = Node(info[0].offset, info[0].element[0], info[0].element[1])
    for i in 1..<info.count {
        let (index, x, y) = (info[i].offset, info[i].element[0], info[i].element[1])
        let newNode: Node? = Node(index, x, y)
        var parent = root
        while true {
            if newNode!.x < parent!.x {
                if parent?.left == nil {
                    parent?.left = newNode
                    break
                }
                parent = parent?.left
            } else if newNode!.x > parent!.x {
                if parent?.right == nil {
                    parent?.right = newNode
                    break
                }
                parent = parent?.right
            }
        }
    }

    var preOrder: [Int] = []
    var postOrder: [Int] = []
    func pre(_ node: Node?) {
        guard let node = node else { return }
        preOrder.append(node.index + 1)
        pre(node.left)
        pre(node.right)
    }
    func post(_ node: Node?) {
        guard let node = node else { return }
        post(node.left)
        post(node.right)
        postOrder.append(node.index + 1)
    }
    pre(root)
    post(root)
    return [preOrder, postOrder]
}
print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))