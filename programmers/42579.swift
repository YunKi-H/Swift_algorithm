import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var answer: [Int] = []
    var genreSum: [String: Int] = .init()
    var genrePlay: [String: [(num: Int, play: Int)]] = .init()
    for i in 0..<genres.count {
        let genre = genres[i]
        genreSum[genre, default: 0] += plays[i]
        genrePlay[genre, default: []].append((i, plays[i]))
    }
    for (genre, value) in genreSum.sorted(by: { $0.value > $1.value}) {
        let play = genrePlay[genre]!.sorted(by: { $0.play > $1.play })
        for i in 0..<play.count where i < 2 {
            answer.append(play[i].num)
        }
    }
    return answer
}