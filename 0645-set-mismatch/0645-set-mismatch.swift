class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var frequent = [Int: Int]()
        for num in nums {
            frequent[num] = frequent[num, default: 0] + 1
        }
        var res = [0, 0]
        for i in 1...nums.count {
            if let count = frequent[i] {
                if count != 1 {
                    res[0] = i
                }
            } else {
                res[1] = i
            }
        }
        return res
    }
}