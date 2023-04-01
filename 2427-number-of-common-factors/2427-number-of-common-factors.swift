class Solution {
    func commonFactors(_ a: Int, _ b: Int) -> Int {
        var res = 0
        for i in 1...min(a, b) {
            if a % i == 0 && b % i == 0 {
                res += 1
            }
        }
        return res
    }
}
