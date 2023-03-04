class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        let n = chars.count
        var left = 0
        var write = 0
        while left < n {
            var right = left + 1
            while right < n && chars[right] == chars[right - 1] {
                right += 1
            }
            
            var string = "\(chars[left])"
            let count = right - left
            if count > 1 {
                string += "\(count)"
            }
            for char in string {
                chars[write] = char
                write += 1
            }
            
            left = right
        }
        chars.removeLast(chars.count - write)
        return write
    }
}