class Solution {
    func countTime(_ time: String) -> Int {
        let chars = [Character](time),
            a = chars[0],
            b = chars[1],
            c = chars[3],
            d = chars[4]
        var res = 1
        if d == "?" {
            res *= 10
        }
        if c == "?" {
            res *= 6
        }
        if a == b && a == "?" {
            return res * 24
        } else if a == "?" {
            res *= ("456789".contains(b) ? 2 : 3)
        } else if b == "?" {
            res *= (a == "2" ? 4 : 10)
        }
        return res
    }
}
