class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        let sorted = words.sorted {
            $0.count < $1.count
        }
        let n = sorted.count
        var res = [String]()
        for i in 0..<(n-1) {
            let wordI = sorted[i]
            for j in (i+1)..<n {
                let wordJ = sorted[j]
                if wordJ.contains(wordI) {
                    res.append(wordI)
                    break
                }
            }
        }
        return res
    }
}