class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let charA = [Character](a),
            charB = [Character](b)
        var i = charA.count - 1, j = charB.count - 1
        var extra = 0, res: String = ""
        while i >= 0 || j >= 0 || extra > 0 {
            var sum = extra
            if i >= 0 {
                sum += charA[i] == "1" ? 1 : 0
                i -= 1
            }
            if j >= 0 {
                sum += charB[j] == "1" ? 1 : 0
                j -= 1
            }
            extra = sum / 2
            res = "\(sum % 2)" + res
        }
        return res
    }
}
