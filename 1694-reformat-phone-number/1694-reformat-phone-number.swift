class Solution {
    func reformatNumber(_ number: String) -> String {
        var numberChars = [Character](number).filter {
            $0 != " " && $0 != "-"
        }
        let mod = numberChars.count % 3
        var endIndex = 0
        if mod == 1 {
            numberChars.insert("-", at: numberChars.count - 2)
            endIndex = numberChars.count - 5
        } else {
            endIndex = mod == 0 ? numberChars.count - 3 : numberChars.count / 3 * 3
        }
        for i in stride(from: endIndex, to: 0, by: -3) {
            numberChars.insert("-", at: i)
        }
        return String(numberChars)
    }
}