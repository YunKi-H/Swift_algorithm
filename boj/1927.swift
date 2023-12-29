// https://www.acmicpc.net/problem/1927

import Foundation

struct Heap {
  var heapArr: [Int] = []

  mutating func insert(_ value: Int) {
    if heapArr.isEmpty {
      heapArr.append(0)
      heapArr.append(value)
    } else {
      heapArr.append(value)

      var insertedIndex = heapArr.count - 1

      while moveUp(insertedIndex) {
        let parentIndex = insertedIndex / 2
        heapArr.swapAt(insertedIndex, parentIndex)
        insertedIndex = parentIndex
      }
    }
  }

  private func moveUp(_ insertedIndex: Int) -> Bool {
    if insertedIndex <= 1 {
      return false
    } else {
      let parentIndex = insertedIndex / 2
      if heapArr[parentIndex] > heapArr[insertedIndex] {
        return true
      }
      return false
    }
  }

  mutating func pop() -> Int {
    if heapArr.count <= 1 {
      return 0
    }

    let popedData = heapArr[1]
    heapArr[1] = heapArr.last!
    heapArr.removeLast()
    var popedIndex = 1

    while moveDown(popedIndex) {
      let leftChildIndex = popedIndex * 2
      let rightChildIndex = popedIndex * 2 + 1

      if rightChildIndex >= heapArr.count {
        if heapArr[popedIndex] > heapArr[leftChildIndex] {
          heapArr.swapAt(popedIndex, leftChildIndex)
          popedIndex = leftChildIndex
        }
      } else {
        if heapArr[leftChildIndex] > heapArr[rightChildIndex] {
          if heapArr[popedIndex] > heapArr[rightChildIndex] {
            heapArr.swapAt(popedIndex, rightChildIndex)
            popedIndex = rightChildIndex
          }
        } else {
          if heapArr[popedIndex] > heapArr[leftChildIndex] {
            heapArr.swapAt(popedIndex, leftChildIndex)
            popedIndex = leftChildIndex
          }
        }
      }
    }
    return popedData
  }

  mutating func moveDown(_ popedIndex: Int) -> Bool {
    let leftChildIndex = popedIndex * 2
    let rightChildIndex = popedIndex * 2 + 1

    if leftChildIndex >= heapArr.count {
       return false
    } else if rightChildIndex >= heapArr.count {
      if heapArr[popedIndex] > heapArr[leftChildIndex] {
        return true
      }
      return false
    } else {
      if heapArr[leftChildIndex] > heapArr[rightChildIndex] {
          if heapArr[popedIndex] > heapArr[rightChildIndex] {
              return true
          } else {
              return false
          }
      } else {
          if heapArr[popedIndex] > heapArr[leftChildIndex] {
              return true
          } else {
              return false
          }
      }
    }
  }
}

let n = Int(readLine()!)!
var heap = Heap()
for _ in 1...n {
  let x = Int(readLine()!)!
  if x == 0 {
    print(heap.pop())
  } else {
    heap.insert(x)
  }
}