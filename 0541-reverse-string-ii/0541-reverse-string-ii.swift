class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var res: String = "", temp: String = ""
        for (i, char) in s.enumerated() {
            temp.append(char)
            if i % k == k - 1 {
                if (i / k) % 2 == 1 {
                    res += temp
                } else {
                    res += temp.reversed()
                }
                temp = ""
            }
        }
        if (s.count / k) % 2 == 0 {
            res += temp.reversed()
        } else {
            res += temp
        }
        return res
    }
}