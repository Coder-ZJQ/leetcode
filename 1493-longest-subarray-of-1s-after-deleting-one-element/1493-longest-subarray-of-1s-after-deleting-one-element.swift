class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var oneCount = 0, zeroCount = 0
        var counts = [Int]()
        for num in nums {
            if num == 0 {
                zeroCount -= 1
                if oneCount != 0 {
                    counts.append(oneCount)
                    oneCount = 0
                }
            } else {
                oneCount += 1
                if zeroCount != 0 {
                    counts.append(zeroCount)
                    zeroCount = 0
                }
            }
        }
        counts.append(zeroCount != 0 ? zeroCount : oneCount)
        let maxCount = counts.max()!
        guard maxCount > 0 else {
            return 0
        }
        var res = maxCount
        if counts.count == 1 {
            return res - 1
        }
        let n = counts.count
        for i in 0..<n where counts[i] == -1 {
            var sum = 0
            if i - 1 >= 0 {
                sum += counts[i - 1]
            }
            if i + 1 < n {
                sum += counts[i + 1]
            }
            res = max(res, sum)
        }
        
        return res
    }
}