class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard nums.count > 0 else { return [] }
        var pre = nums[0], array = [pre], result = [String]()
        for num in nums[1...] {
            if num - pre == 1 {
                array.append(num)
            } else {
                result.append(array.count == 1 ? "\(array[0])" : "\(array.first!)->\(array.last!)")
                array = [num]
            }
            pre = num
        }
        result.append(array.count == 1 ? "\(array[0])" : "\(array.first!)->\(array.last!)")
        return result
    }
}
