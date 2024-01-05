// https://www.acmicpc.net/problem/11723

// import Foundation

// let m = Int(readLine()!)!
// var s: [Bool] = Array(repeating: false, count: 21)
// for _ in 0..<m {
//   let input = readLine()!.split { $0 == " " }
//   let oper = input[0]
//   let x = input.count > 1 ? Int(input[1])! : 0

//   switch oper {
//   case "add":
//     s[x] = true
//   case "remove":
//     s[x] = false
//   case "check":
//     print(s[x] ? 1 : 0)
//   case "toggle":
//     s[x].toggle()
//   case "all":
//     s = Array(repeating: true, count: 21)
//   default:
//     s = Array(repeating: false, count: 21)
//   }
// }

import Foundation

class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStringSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

let fileIO = FileIO()

let m = fileIO.readInt()
var s: [Bool] = Array(repeating: false, count: 21)
for _ in 0..<m {
  let oper = fileIO.readStringSum()

  switch oper {
  case 297:
    s[fileIO.readInt()] = true
  case 654:
    s[fileIO.readInt()] = false
  case 510:
    print(s[fileIO.readInt()] ? 1 : 0)
  case 642:
    s[fileIO.readInt()].toggle()
  case 313:
    s = Array(repeating: true, count: 21)
  default:
    s = Array(repeating: false, count: 21)
  }
}