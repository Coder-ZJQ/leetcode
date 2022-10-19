class Solution {
    
    private func splitCamelString(_ string: String) -> [String] {
        var str: String = "", res = [String]()
        for char in string {
            if char.isUppercase && !str.isEmpty {
                if str.first!.isUppercase {
                    res.append(str)
                }
                str = "\(char)"
            } else {
                str += "\(char)"
            }
        }
        if !str.isEmpty {
            res.append(str)
        }
        return res
    }
    
    private func isMatched(query: String, pattern: String) -> Bool {
        let queryChars = [Character](query), n = queryChars.count
        var begin = 0
        for char in pattern {
            if begin < n, let index = queryChars[begin...].firstIndex(of: char) {
                begin = index + 1
            } else {
                return false
            }
        }
        return true
    }
    
    func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
        let patternCamels = splitCamelString(pattern)
        return queries.map {
            let queryCamels = splitCamelString($0)
            guard queryCamels.count == patternCamels.count else {
                return false
            }
            for (qry, pat) in zip(queryCamels, patternCamels) {
                if !isMatched(query: qry, pattern: pat) {
                    return false
                }
            }
            return true
        }
    }
}
