class Solution {
    func maximumSwap(_ num: Int) -> Int {
        guard num > 0 else { return 0 }
        var nums = [Int]()
        var temp = num
        while temp > 0 {
            nums.append(temp % 10)
            temp /= 10
        }
        var maxNums = nums
        for i in 1..<maxNums.count {
            maxNums[i] = max(maxNums[i - 1], maxNums[i])
        }
        
        let index = zip(nums, maxNums).enumerated().reversed().first {
            $0.element.0 != $0.element.1
        }?.offset
        
        if let i = index {
            let j = nums.firstIndex {
                $0 == maxNums[i]
            }!
            (nums[i], nums[j]) = (nums[j], nums[i])
            var res = 0, ten = 1
            for num in nums {
                res += ten * num
                ten *= 10
            }
            return res
        }
        return num
    }
}