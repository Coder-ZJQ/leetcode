class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        for i in 0..<nums.count - 2 {
            let a = nums[i],
                b = nums[i + 1],
                c = nums[i + 2]
            if a < b + c {
                return a + b + c
            }
        }
        return 0
    }
}
