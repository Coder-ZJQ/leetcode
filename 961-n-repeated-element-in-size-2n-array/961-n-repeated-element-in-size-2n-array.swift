class Solution {
    func repeatedNTimes(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return num
            } else {
                set.insert(num)
            }
        }
        return 0
    }
}
