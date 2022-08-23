class Solution {
    func greatestLetter(_ s: String) -> String {
        let set = Set<Character>(s)
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".reversed()
        for char in letters {
            if set.contains(char) && set.contains(char.lowercased().first!) {
                return "\(char)"
            }
        }
        return ""
    }
}
