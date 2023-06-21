class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: -1, count: n)
        /// 直径
        let diameter = k * 2 + 1
        guard n >= diameter else {
            return res
        }
        var sum = nums[..<diameter].reduce(0, +)
        res[k] = sum / diameter
        for i in k+1..<n-k {
            sum += (nums[i + k] - nums[i - k - 1])
            res[i] = sum / diameter
        }
        return res
    }
}