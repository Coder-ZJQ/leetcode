extension Character {
    var isVowel: Bool {
        self == "a" || self == "e" || self == "i" || self == "o" || self == "u"
    }
}

class Solution {
    func maxVowels(_ s: String, _ k: Int) -> Int {
        var chars = [Character](s)
        var vowelCount = chars[..<k].reduce(0) { partialResult, char in
            char.isVowel ? partialResult + 1 : partialResult
        }
        var res = vowelCount
        for (i, char) in chars[k...].enumerated() {
            if chars[i].isVowel {
                vowelCount -= 1
            }
            if char.isVowel {
                vowelCount += 1
            }
            res = max(res, vowelCount)
        }
        return res
    }
}