class Solution {
    private func isLetter(_ c: Character) -> Bool {
        guard let asciiValue = c.asciiValue else { return false }
        return (asciiValue >= 65 && asciiValue <= 90) || (asciiValue >= 97 && asciiValue <= 122)
    }
    func reverseOnlyLetters(_ s: String) -> String {
        var chars = [Character](s)
        var l = 0, r = chars.count - 1
        while l < r {
            if !isLetter(chars[l]) {
                l += 1
                continue
            }
            if !isLetter(chars[r]) {
                r -= 1
                continue
            }
            (chars[l], chars[r]) = (chars[r], chars[l])
            l += 1
            r -= 1
        }
        return String(chars)
    }
}