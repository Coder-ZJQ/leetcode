class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var i = 0, j = nums.count - 1, res = [Int]()
        while i <= j {
            let numI = nums[i], numJ = nums[j]
            if abs(numI) < abs(numJ) {
                res.append(numJ * numJ)
                j -= 1
            } else {
                res.append(numI * numI)
                i += 1
            }
        }
        return res.reversed()
    }
}
