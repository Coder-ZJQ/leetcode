class Solution {
    func cellsInRange(_ s: String) -> [String] {
        let chars = [Character](s)
        let char1 = chars[0].asciiValue!,
            num1 = chars[1].asciiValue!,
            char2 = chars[3].asciiValue!,
            num2 = chars[4].asciiValue!
        var res = [String]()
        for char in char1...char2 {
            for num in num1...num2 {
                res.append("\(Character(UnicodeScalar(char)))\(Character(UnicodeScalar(num)))")
            }
        }
        return res
    }
}