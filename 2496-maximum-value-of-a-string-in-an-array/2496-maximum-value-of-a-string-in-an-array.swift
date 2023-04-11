class Solution {
    func maximumValue(_ strs: [String]) -> Int {
        strs.map {
            Int($0) ?? $0.count
        }.max()!
    }
}
