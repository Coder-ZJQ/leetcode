class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n >= 2 else { return 1 }
        var nums = [Int](repeating: 1, count: n + 1)
        var i2 = 1, i3 = 1, i5 = 1
        for i in 2...n {
            let a = nums[i2] * 2,
                b = nums[i3] * 3,
                c = nums[i5] * 5
            let min = min(a, b, c)
            if min == a {
                i2 += 1
            }
            if min == b {
                i3 += 1
            }
            if min == c {
                i5 += 1
            }
            nums[i] = min
        }
        print(nums)
        return nums[n]
    }
}