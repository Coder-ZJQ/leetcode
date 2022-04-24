
class Solution {
    
    private var dict: [Int: [Int]]

    init(_ nums: [Int]) {
        dict = [:]
        for (i, num) in nums.enumerated() {
            if let _ = dict[num] {
                dict[num]!.append(i)
            } else {
                dict[num] = [i]
            }
        }
    }
    
    func pick(_ target: Int) -> Int {
        let arr = dict[target]!
        if arr.count == 1 {
            return arr.first!
        }
        return arr.randomElement()!
    }
}
/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: Int = obj.pick(target)
 */