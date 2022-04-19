class Solution {
    func maximumNumber(_ num: String, _ change: [Int]) -> String {
        var chars = [Character](num)
        if let start = chars.firstIndex(where: { char in
            let index = Int(char.asciiValue!) - 48
            let val = change[index]
            return val > index
        }) {
            for i in start..<chars.count {
                let index = Int(chars[i].asciiValue!) - 48
                let val = change[index]
                if val >= index {
                    chars[i] = "\(val)".first!
                } else {
                    break
                }
            }
            return String(chars)
        }
        return num
    }
}