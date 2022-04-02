class Solution {
    
    private func validPalindrome(_ chars: [Character], _ left: Int, _ right: Int) -> Bool {
        var left = left, right = right
        while left < right {
            if chars[left] == chars[right] {
                left += 1
                right -= 1
            } else {
                return false
            }
        }
        return true
    }
    
    func validPalindrome(_ s: String) -> Bool {
        let chars = [Character](s), n = chars.count
        var left = 0, right = n - 1
        while left < right {
            let charLeft = chars[left],
                charRight = chars[right]
            if charLeft == charRight {
                left += 1
                right -= 1
            } else {
                return validPalindrome(chars, left + 1, right) || validPalindrome(chars, left, right - 1)
            }
        }
        return true
    }
}