import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedIDs = Set<[Int]>()
    let userid = user_id.map { $0.map { String($0) } }
    let bannedid = banned_id.map { $0.map { String($0) } }

    func permutation(_ idx: Int, _ selected: [Int]) {
        if selected.count == banned_id.count {
            var used = Array(repeating: false, count: banned_id.count)
            
            for i in selected {
                let user = userid[i]
                for j in 0..<banned_id.count {
                    if used[j] { continue }
                    
                    let ban = bannedid[j]
                    guard user.count == ban.count else { continue }
                    
                    var isValid = true
                    for k in 0..<user.count {
                        if ban[k] == "*" { continue }
                        guard user[k] == ban[k] else {
                            isValid = false
                            break
                        }
                    }
                    if isValid {
                        used[j] = true
                        break
                    }
                }
            }
            guard used.filter { !$0 }.count == 0 else { return }
            bannedIDs.insert(selected.sorted())
            return
        }
        guard !selected.contains(idx) else { return }
        
        for i in 0..<user_id.count {
            permutation(i, selected + [idx])
        }
    }
    
    for i in 0..<user_id.count {
        permutation(i, [])
    }
    
    return bannedIDs.count
}