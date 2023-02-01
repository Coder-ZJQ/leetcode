class Solution {
    
    private func check(string: String, divisor: String) -> Bool {
        let count = string.count / divisor.count
        var str: String = ""
        for _ in 0..<count {
            str += divisor
        }
        return string == str
    }
    
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        let chars1 = [Character](str1),
            chars2 = [Character](str2),
            count1 = chars1.count,
            count2 = chars2.count
        let start = min(count1, count2)
        for i in stride(from: start, through: 1, by: -1) where count1 % i == 0 && count2 % i == 0 {
            let divisor = String(chars1[0..<i])
            if check(string: str1, divisor: divisor) && check(string: str2, divisor: divisor) {
                return divisor
            }
        }
        return ""
    }
}