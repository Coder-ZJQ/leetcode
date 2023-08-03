class Solution {
    func removeComments(_ source: [String]) -> [String] {
        var blockOpen = false
        var res = [String]()
        var newCode: String = ""
        for code in source {
            let chars = [Character](code), n = chars.count
            var skipOne = false
            for i in 0..<n {
                if skipOne {
                    skipOne = false
                    continue
                }
                if !blockOpen {
                    if i + 1 < n && chars[i] == "/" && chars[i+1] == "*" {
                        blockOpen = true
                        skipOne = true
                    } else if i + 1 < n && chars[i] == "/" && chars[i+1] == "/" {
                        break
                    } else {
                        newCode.append(chars[i])
                    }
                    
                    
                } else {
                    if i + 1 < n && chars[i] == "*" && chars[i+1] == "/" {
                        blockOpen = false
                        skipOne = true
                    }
                }
            }
            
            if !blockOpen && !newCode.isEmpty {
                res.append(newCode)
                newCode = ""
            }
            
        }
        return res
    }
}