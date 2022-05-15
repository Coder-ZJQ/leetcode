class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        // 排序
        let sorted = nums.sorted(by: >)
        for i in 0..<sorted.count - 2 {
            let num0 = sorted[i],
                num1 = sorted[i + 1],
                num2 = sorted[i + 2]
            // 两边之和大于第三边
            if num0 < num1 + num2 {
                return num0 + num1 + num2
            }
        }
        return 0
    }
}