class Solution {
    func countPairs(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: [Int]]()
        for (i, num) in nums.enumerated() {
            dict[num] = dict[num, default: []] + [i]
        }
        return dict.reduce(0) { partialResult, pair in
            let indexes = pair.value, n = indexes.count
            guard n > 1 else { return partialResult }
            var count = 0
            for i in 0..<(n - 1) {
                for j in (i + 1)..<n {
                    if indexes[i] * indexes[j] % k == 0 {
                        count += 1
                    }
                }
            }
            return partialResult + count
        }
    }
}