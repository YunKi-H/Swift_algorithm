import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    return balls.map {
        let (endX, endY) = ($0[0], $0[1])
        var dist = Int.max
        // top
        if startX != endX || startY > endY {
            let width = abs(startX - endX)
            let height = n - startY + n - endY
            dist = min(dist, width * width + height * height)
        }
        // bottom
        if startX != endX || startY < endY {
            let width = abs(startX - endX)
            let height = startY + endY
            dist = min(dist, width * width + height * height)
        }
        // left
        if startY != endY || startX < endX {
            let width = startX + endX
            let height = abs(startY - endY)
            dist = min(dist, width * width + height * height)
        }
        // right
        if startY != endY || startX > endX {
            let width = m - startX + m - endX
            let height = abs(startY - endY)
            dist = min(dist, width * width + height * height)
        }
        return dist
    }
}