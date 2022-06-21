class Solution {
    func defangIPaddr(_ address: String) -> String {
        var res = ""
        for char in address {
            if char == "." {
                res += "[.]"
            } else {
                res.append(char)
            }
        }
        return res
    }
}
