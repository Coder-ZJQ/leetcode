class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        s.count == goal.count ? NSString(string: goal + goal).contains(s) : false
    }
}