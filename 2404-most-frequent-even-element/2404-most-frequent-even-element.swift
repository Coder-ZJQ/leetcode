class Solution {
    func mostFrequentEven(_ nums: [Int]) -> Int {
        var freq = [Int: Int]()
        for num in nums where num % 2 == 0 {
            freq[num] = freq[num, default: 0] + 1
        }
        return freq.max {
            if $0.value == $1.value {
                return $0.key > $1.key
            }
            return $0.value < $1.value
        }?.key ?? -1
    }
}
