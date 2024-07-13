class Solution {
    func canSortArray(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n >= 2 else {
            return true
        }
        let bitCount = nums.map(\.nonzeroBitCount)
        var minMaxTuple = [(min: Int, max: Int)]()
        var minNum = nums[0], maxNum = nums[0]
        for i in 1..<n {
            let num = nums[i]
            if bitCount[i] != bitCount[i - 1] {
                minMaxTuple.append((minNum, maxNum))
                minNum = num
                maxNum = num
            }
            minNum = min(minNum, num)
            maxNum = max(maxNum, num)
        }
        minMaxTuple.append((minNum, maxNum))
        let m = minMaxTuple.count
        guard m > 1 else {
            return true
        }
        for i in 1..<m {
            let cur = minMaxTuple[i], pre = minMaxTuple[i - 1]
            if pre.max > cur.min {
                return false
            }
        }
        return true
    }
}