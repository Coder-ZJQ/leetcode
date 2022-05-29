class Solution {
    
    private func countOf(char: Character, in string: String) -> Int {
        var count = 0
        for c in string where c == char {
            count += 1
        }
        return count
    }
    
    private func isIPv4(_ queryIp: String) -> Bool {
        let count = countOf(char: ".", in: queryIp)
        guard count == 3 else {
            return false
        }
        let splits = queryIp.split(separator: ".")
        guard splits.count == 4 else {
            return false
        }
        for split in splits {
            // 控制均为数字
            for c in split {
                if c < "0" || c > "9" {
                    return false
                }
            }
            let n = split.count
            // 不能包含前导 0
            if split.count > 1 && split.first! == "0" {
                return false
            }
            // 位数控制在 1~3 位，防止转换为 int 溢出
            guard n >= 1 && n <= 3 else {
                return false
            }
            guard let num = Int(split) else {
                return false
            }
            // 0~255 之间
            if num > 255 {
                return false
            }
        }
        return true
    }
    private func isIPv6(_ queryIp: String) -> Bool {
        let count = countOf(char: ":", in: queryIp)
        guard count == 7 else {
            return false
        }
        let splits = queryIp.split(separator: ":")
        guard splits.count == 8 else {
            return false
        }
        for split in splits {
            let n = split.count
            guard n >= 1 && n <= 4 else {
                return false
            }
            for c in split {
                if (c < "0" || c > "9") && (c < "a" || c > "f") && (c < "A" || c > "F") {
                    return false
                }
            }
        }
        return true
    }
    
    func validIPAddress(_ queryIP: String) -> String {
        if isIPv4(queryIP) {
            return "IPv4"
        }
        if isIPv6(queryIP) {
            return "IPv6"
        }
        return "Neither"
    }
}