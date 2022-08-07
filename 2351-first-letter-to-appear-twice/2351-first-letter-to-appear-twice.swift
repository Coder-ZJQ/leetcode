class Solution {
    func repeatedCharacter(_ s: String) -> Character {
        var charSet = Set<Character>()
        for c in s {
            if charSet.contains(c) {
                return c
            } else {
                charSet.insert(c)
            }
        }
        return " "
    }
}
