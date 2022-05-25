class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails = [nums[0]]
        for num in nums[1...] {
            let tail = tails.last!
            if num > tail {
                tails.append(num)
            } else {
                // 二分查找，找到第一个比当前大的位置并替换
                var l = 0, r = tails.count - 1
                while l < r {
                    let m = l + (r - l) >> 1
                    if tails[m] < num {
                        l = m + 1
                    } else {
                        r = m
                    }
                }
                tails[l] = num
            }
        }
        return tails.count
    }
}