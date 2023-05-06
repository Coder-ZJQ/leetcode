class Solution {
    func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
        var c = 0, r = 0, o = 0, a = 0, k = 0, res = 0
        for char in croakOfFrogs {
            guard c >= 0 && r >= 0 && o >= 0 && a >= 0 else {
                return -1
            }
            switch char {
            case "c":
                if k > 0 {
                    k -= 1
                } else {
                    res += 1
                }
                c += 1
            case "r":
                r += 1
                c -= 1
            case "o":
                o += 1
                r -= 1
            case "a":
                a += 1
                o -= 1
            default:
                k += 1
                a -= 1
            }
        }
        return c != 0 || r != 0 || o != 0 || a != 0 ? -1 : res
    }
}