import Foundation

func solution(_ inputJobs:[[Int]]) -> Int {
    var jobs = inputJobs.sorted {
        if $0[0] == $1[0] {
            return $0[1] > $1[1]
        }
        return $0[0] > $1[0]
    }
    var waiting: [[Int]] = [jobs.removeLast()]
    var now = waiting.first![0]
    var sum = 0
    
    while !waiting.isEmpty {
        let current = waiting.removeLast()
        sum += abs(current[0] - now) + current[1]
        now += current[1]
        
        while !jobs.isEmpty && jobs.last![0] <= now {
            waiting.append(jobs.removeLast())
        }
        waiting.sort(by: { $0[1] > $1[1] })
        
        if waiting.isEmpty && !jobs.isEmpty {
            waiting.append(jobs.removeLast())
            now = waiting.last![0]
        }
    }
    return sum / inputJobs.count
}

print(solution([[0, 3], [1, 9], [2, 6]]))