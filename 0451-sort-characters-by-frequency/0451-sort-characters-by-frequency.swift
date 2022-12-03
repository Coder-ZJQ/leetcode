class Solution {
    func frequencySort(_ s: String) -> String {
        var dict = [Character: Int]()
        for c in s {
            dict[c] = dict[c, default: 0] + 1
        }
        return dict.sorted {
            $0.value > $1.value
        }.map {
            String([Character](repeating: $0.key, count: $0.value))
        }.joined()
    }
}
