import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var timeByCar: [String: [Int]] = [:]
    for record in records {
        let splited = record.split { $0 == " " }.map { String($0) }
        let time = splited[0].split { $0 == ":" }.map { Int($0)! }
        timeByCar[splited[1], default: []].append(time[0] * 60 + time[1])
    }
    let accumulated: [(car: String, time: Int)] = timeByCar.map { (key, value) in
        var time = 0
        let times = value.sorted()
        for (idx, t) in times.enumerated() {
            if idx % 2 == 0 { // in
                time += 1439 - t
            } else { // out
                time -= 1439 - t
            }
        }
        return (key, time)
    }.sorted(by: { $0.car < $1.car })
    
    return accumulated.map {
        if $0.time < fees[0] { return fees[1] }
        let overed = $0.time - fees[0] + (($0.time - fees[0]) % fees[2] > 0 ? fees[2] : 0)
        return fees[1] + (overed / fees[2]) * fees[3]
    }
}