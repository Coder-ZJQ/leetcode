class Solution {
    func digitSum(_ s: String, _ k: Int) -> String {
        var chars = [Character](s)
        while chars.count > k {
            var i = 0
            var string: String = "",
                sum = 0
            while i < chars.count {
                sum += Int(chars[i].asciiValue!) - 48
                if (i + 1) % k == 0 {
                    string += "\(sum)"
                    sum = 0
                }
                i += 1
            }
            if chars.count % k > 0 {
                string += "\(sum)"
            }
            chars = [Character](string)
        }
        return String(chars)
    }
}