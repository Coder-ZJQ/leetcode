class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        zip(l, r).map { left, right in
            let subarray = nums[left...right]
            let max = subarray.max()!
            let min = subarray.min()!
            guard (max - min) % (subarray.count - 1) == 0 else {
                return false
            }
            let delta = (max - min) / (subarray.count - 1)
            guard delta > 0 else {
                return true
            }
            var bools = [Bool](repeating: false, count: subarray.count)
            for num in subarray {
                let diff = num - min
                guard diff % delta == 0 else {
                    return false
                }
                let index = diff / delta
                guard index < subarray.count, !bools[index] else {
                    return false
                }
                bools[index] = true
            }
            return true
        }
    }
}