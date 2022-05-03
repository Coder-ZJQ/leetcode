class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var numberLogs = [String]()
        var letterLogs = [String]()
        for log in logs {
            let index = log.index(after: log.firstIndex(of: " ")!)
            if log[index].isNumber {
                numberLogs.append(log)
            } else {
                letterLogs.append(log)
            }
        }
        
        letterLogs = letterLogs.sorted { string1, string2 in
            let index1 = string1.index(after: string1.firstIndex(of: " ")!)
            let index2 = string2.index(after: string2.firstIndex(of: " ")!)
            // 相等则比较标识符
            if string1[index1...] == string2[index2...] {
                return string1[..<index1] < string2[..<index2]
            }
            // 不相等则比较内容
            return string1[index1...] < string2[index2...]
            
        }
        return letterLogs + numberLogs
    }
}