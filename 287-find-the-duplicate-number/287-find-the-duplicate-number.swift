class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0], fast = nums[slow]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        fast = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        return slow
    }
}
