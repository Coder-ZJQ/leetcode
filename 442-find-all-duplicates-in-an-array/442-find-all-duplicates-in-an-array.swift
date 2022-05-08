class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var isDuplicates = [Bool](repeating: false, count: nums.count + 1)
        var res = [Int]()
        for num in nums {
            if isDuplicates[num] {
                res.append(num)
            } else {
                isDuplicates[num] = true
            }
        }
        return res
    }
}
