class Solution {
    func findClosestNumber(_ nums: [Int]) -> Int {
        nums.min {
            // 如果绝对值小直接返回
            // 如果绝对值相等，取大的
            abs($0) < abs($1) || (abs($0) == abs($1) && $0 > $1)
        }!
    }
}