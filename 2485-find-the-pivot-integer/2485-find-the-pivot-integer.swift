class Solution {
    func pivotInteger(_ n: Int) -> Int {
        [1: 1, 8: 6, 49: 35, 288: 204][n] ?? -1
    }
}
