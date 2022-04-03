class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        guard let last = letters.last, last > target else {
            return letters.first!
        }
        var left = 0, right = letters.count - 1
        while left < right {
            let mid = left + (right - left) >> 1,
                midChar = letters[mid]
            if midChar <= target {
                left = mid + 1
            } else {
                right = mid
            }
            
        }
        return letters[left]
    }
}