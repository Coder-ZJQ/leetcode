class Solution {
    func minDeletions(_ s: String) -> Int {
        var frequency = [Int](repeating: 0, count: 26)
        for c in s {
            frequency[Int(c.asciiValue!) - 97] += 1
        }
        frequency = frequency.filter {
            $0 > 0
        }.sorted(by: >)
        var set = Set<Int>(), res = 0
        for fre in frequency {
            var tempFre = fre
            while set.contains(tempFre) && tempFre > 0 {
                tempFre -= 1
            }
                
            set.insert(tempFre)
            res += fre - tempFre
        }
        return res
    }
}