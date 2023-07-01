class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indexes = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let i = indexes[target - num] {
                return [i, index]
            }
            indexes[num] = index
        }
        return []
    }
}
