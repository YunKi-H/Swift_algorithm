import Foundation

func solution(_ beginning:[[Int]], _ target:[[Int]]) -> Int {
    let h = beginning.count
    let w = beginning[0].count
    var map = beginning
    var answer = 11
    
    func dfs(_ current: Int, _ count: Int) {
        if current == h {
            var result = count
            for i in 0..<w {
                let flag = map[0][i] == target[0][i]
                for j in 0..<h {
                    if (map[j][i] == target[j][i]) != flag {
                        return
                    }
                }
                if !flag { result += 1 }
            }
            answer = min(answer, result)
            return
        }
        
        dfs(current + 1, count)
        for i in 0..<w {
            map[current][i] = map[current][i] == 1 ? 0 : 1
        }
        dfs(current + 1, count + 1)
        for i in 0..<w {
            map[current][i] = map[current][i] == 1 ? 0 : 1
        }
    }
    
    dfs(0, 0)
    
    return answer == 11 ? -1 : answer
}