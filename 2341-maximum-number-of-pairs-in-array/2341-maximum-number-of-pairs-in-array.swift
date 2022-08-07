class Solution {
    func numberOfPairs(_ nums: [Int]) -> [Int] {
        var count = 0, set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                set.remove(num)
                count += 1
            } else {
                set.insert(num)
            }
        }
        return [count, set.count]
    }
}