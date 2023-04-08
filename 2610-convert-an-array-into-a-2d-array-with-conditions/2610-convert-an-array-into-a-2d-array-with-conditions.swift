class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var counter = [Int](repeating: 0, count: 201),
            maxCount = 0
        for num in nums {
            counter[num] += 1
            maxCount = max(maxCount, counter[num])
        }
        var res = [[Int]](repeating: [], count: maxCount)
        for num in 1...200 {
            let count = counter[num]
            for i in 0..<count {
                res[i].append(num)
            }
        }
        return res
    }
}