import Foundation

func solution(_ scores:[[Int]]) -> Int {
    let me = scores[0]
    let myScore = me[0] + me[1]
    let sortedScores = scores.sorted(by: {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] > $1[0]
    })
    var maxPeer = 0
    var rank = 1
    for score in sortedScores {
        if score[0] > me[0] && score[1] > me[1] { return -1 }
        if maxPeer <= score[1] {
            maxPeer = score[1]
            if myScore < score[0] + score[1] {
                rank += 1
            }
        }
    }
    return rank
}