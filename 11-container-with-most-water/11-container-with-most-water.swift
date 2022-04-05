class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1, res = 0
        while left < right {
            let width = right - left,
                hl = height[left],
                hr = height[right]
            let height = min(hl, hr)
            res = max(res, width * height)
            if hr > hl {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}
