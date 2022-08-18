class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var freq = [Int: Int]()
        for num in arr {
            freq[num] = freq[num, default: 0] + 1
        }
        let sorted = freq.sorted {
            $0.value > $1.value
        }
        let n = arr.count
        var half = n / 2
        var i = 0
        
        while i < n && half - sorted[i].value > 0 {
            half -= sorted[i].value
            i += 1
        }
        
        return i + 1
    }
}
