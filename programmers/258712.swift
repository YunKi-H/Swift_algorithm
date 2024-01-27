import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var AtoB: [String: [String: Int]] = [:]
    var send: [String: Int] = [:]
    var receive: [String: Int] = [:]
    for gift in gifts {
        let gived = gift.split { $0 == " " }.map { String($0) }
        AtoB[gived[0], default: [:]][gived[1], default: 0] += 1
        send[gived[0], default: 0] += 1
        receive[gived[1], default: 0] += 1
    }
    var answer = 0
    for sender in friends {
        var count = 0
        for receiver in friends {
            if sender == receiver { continue }
            if AtoB[sender]?[receiver] ?? 0 > AtoB[receiver]?[sender] ?? 0 {
                count += 1
            } else if AtoB[sender]?[receiver] ?? 0 == AtoB[receiver]?[sender] ?? 0 {
                count += (send[sender] ?? 0) - (receive[sender] ?? 0) > (send[receiver] ?? 0) - (receive[receiver] ?? 0) ? 1 : 0
            }
        }
        answer = max(count, answer)
    }
    return answer
}

print(solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]))
