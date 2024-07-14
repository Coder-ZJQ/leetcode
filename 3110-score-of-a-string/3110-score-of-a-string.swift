class Solution {
    func scoreOfString(_ s: String) -> Int {
        let chars = [Character](s), n = chars.count
        
        return (1..<n).reduce(0) { res, i in
            res + abs(Int(chars[i].asciiValue!) - Int(chars[i - 1].asciiValue!))
        }
    }
}
