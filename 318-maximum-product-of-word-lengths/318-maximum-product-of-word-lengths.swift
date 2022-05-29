class Solution {
    func maxProduct(_ words: [String]) -> Int {
        var res = 0
        // 26 个字母对应 26 位二进制
        let bits = words.map { word in
            word.reduce(0) { partialResult, char in
                let bit = 1 << (char.asciiValue! - 97)
                // 按位或
                return partialResult | bit
            }
        }
        for i in 0..<bits.count {
            let bit1 = bits[i]
            for j in (i + 1)..<bits.count {
                // 按位与如果等于 0 就说明没有相同字母
                if bit1 & bits[j] == 0 {
                    res = max(res, words[i].count * words[j].count)
                }
            }
        }
        return res
    }
}