class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        // 按键对应字符映射
        let map: [Character: [String]] =
        [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        let digitChars = [Character](digits)
        var result = map[digitChars.first!]!
        for digit in digitChars[1...] {
            let chars = map[digit]!
            result = result.map { string in
                chars.map({
                    string + $0
                })
            }.reduce([String](), +)
        }
        return result
    }
}


