/**
 * @param {number[]} nums
 * @param {number} m
 * @return {number}
 */
var isValid = function (nums, target, m) {
    let count = 1, sum = 0
    for (const num of nums) {
        sum += num
        if (sum > target) {
            count++
            sum = num
        }
    }
    return m >= count
}

var splitArray = function(nums, m) {
    let right = 0, left = 0
    for (const num of nums) {
        right += num
        left = Math.max(left, num)
    }
    while (left < right) {
        let mid = left + ((right - left) >> 1)
        if (!isValid(nums, mid, m)) {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return left
};