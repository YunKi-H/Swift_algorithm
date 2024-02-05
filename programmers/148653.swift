import Foundation

func solution(_ storey:Int) -> Int {
    var count = 0
    var story = storey
    while story > 0 {
        switch story % 10 {
        case 0..<5:
            count += story % 10
        case 5:
            if (story / 10) % 10 < 5 {
                count += story % 10
            } else {
                count += 10 - story % 10
                story += 10
            }
        case 6..<10:
            count += 10 - story % 10
            story += 10
        default:
            break
        }
        story /= 10
    }
    return count
}