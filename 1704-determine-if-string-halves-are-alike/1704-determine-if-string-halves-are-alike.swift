class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels = Set<Character>("aeiouAEIOU"),
            n = s.count
        var count = 0
        for (i, c) in s.enumerated() where vowels.contains(c) {
            if i < n / 2 {
                count += 1
            } else {
                count -= 1
            }
        }
        return count == 0
    }
}
