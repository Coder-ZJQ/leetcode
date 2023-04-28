class Solution {
    
    private var f = [Int]()
    
    private func check(_ str0: String, _ str1: String) -> Bool {
        let diff = zip(str0, str1).reduce(0) { partialResult, pair in
            pair.0 != pair.1 ? partialResult + 1 : partialResult
        }
        return diff == 0 || diff == 2
    }
    
    private func find(_ i: Int) -> Int {
        if f[i] != i {
            f[i] = find(f[i])
        }
        return f[i]
    }
    
    func numSimilarGroups(_ strs: [String]) -> Int {
        let n = strs.count
        f = [Int](stride(from: 0, to: n, by: +1))
        for i in 0..<n {
            for j in i + 1..<n {
                let fi = find(i), fj = find(j)
                if fi != fj {
                    if check(strs[i], strs[j]) {
                        f[fi] = fj
                    }
                }
            }
        }
        
        return f.enumerated().reduce(0) {
            $1.element == $1.offset ? $0 + 1 : $0
        }
    }
}