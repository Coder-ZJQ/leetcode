class Solution {
    func numOfPairs(_ nums: [String], _ target: String) -> Int {
        var counts = [String: Int]()
        for num in nums {
            counts[num] = counts[num, default: 0] + 1
        }
        var res = 0
        for i in 0..<target.count-1 {
            let prefix = String(target[...target.index(target.startIndex, offsetBy: i)])
            let suffix = String(target[target.index(target.startIndex, offsetBy: i + 1)...])
            if let prefixCount = counts[prefix], let suffixCount = counts[suffix] {
                if prefix == suffix {
                    res += prefixCount * (prefixCount - 1)
                } else {
                    res += prefixCount * suffixCount
                }
            }
        }
        return res
    }
}