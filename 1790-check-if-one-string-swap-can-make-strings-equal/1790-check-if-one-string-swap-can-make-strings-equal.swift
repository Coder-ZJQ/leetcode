class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        guard s1 != s2 else {
            return true
        }
        var diff = [(Character, Character)]()
        for (c1, c2) in zip(s1, s2) where c1 != c2 {
            diff.append((c1, c2))
            if diff.count > 2 {
                return false
            }
        }
        guard diff.count == 2 else {
            return false
        }
        return diff[0].0 == diff[1].1 && diff[0].1 == diff[1].0
    }
}
