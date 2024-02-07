import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var hashed: [Int] = data.sorted(by: {
        if $0[col - 1] == $1[col - 1] {
            return $0[0] > $1[0]
        }
        return $0[col - 1] < $1[col - 1]
    }).enumerated().map {
        let offset = $0.offset
        let element = $0.element
        var S_i = 0
        for i in element {
            S_i += i % (offset + 1)
        }
        return S_i
    }
    var result = hashed[row_begin - 1]
    for row in row_begin..<row_end {
        result ^= hashed[row]
    }
    return result
}