class Solution {
    func digitCount(_ num: String) -> Bool {
        var counts = [Int](repeating: 0, count: 10)
        for char in num {
            counts[Int(char.asciiValue!) - 48] += 1
        }
        
        let chars = [Character](num)
        for i in 0..<chars.count {
            if counts[i] != Int(chars[i].asciiValue!) - 48 {
                return false
            }
        }
        return true
    }
}