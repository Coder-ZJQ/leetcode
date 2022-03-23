class Solution {
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        var startValue = startValue, target = target, res = 0
        while startValue < target {
            target = target % 2 == 1 ? target + 1 : target / 2
            res += 1
        }
        return res + startValue - target
    }
}
