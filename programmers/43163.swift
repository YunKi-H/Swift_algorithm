import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    func canChange(_ begin: String, _ target: String) -> Bool {
        var count = 0
        for (c1, c2) in zip(begin, target) {
            if count > 2 { return false }
            if c1 != c2 { count += 1 }
        }
        return count == 1
    }
    var answer = words.count
    guard let end = words.firstIndex(of: target) else { return 0 }
    
    for i in 0..<words.count where canChange(words[i], begin) {
        var visited = Array(repeating: -1, count: words.count)
        let start = i
        visited[start] = 1
        var stack = [start]
        var index = 0
        while stack.count > index {
            let currentIndex = stack[index]
            let currentWord = words[currentIndex]
            for i in 0..<words.count where canChange(currentWord, words[i]) {
                if visited[i] >= 0 { continue }
                visited[i] = visited[currentIndex] + 1
                stack.append(i)
            }
            index += 1
        }
        if visited[end] > 0 {
            answer = min(answer, visited[end])
        }
    }
    return answer == words.count ? 0 : answer
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"]))