class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        
        let map: [Character: String] = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]
        return digits.reduce([String]()) { partialResult, char in
            let chars = map[char]!
            var res = [String]()
            for char in chars {
                if partialResult.isEmpty {
                    res.append("\(char)")
                    continue
                }
                for pre in partialResult {
                    res.append(pre + "\(char)")
                }
            }
            return res
        }
    }
}