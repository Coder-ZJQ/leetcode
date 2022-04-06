class Solution {
    func threeSumMulti(_ arr: [Int], _ target: Int) -> Int {
        var res = 0
        var counts = [Int](repeating: 0, count: 101)
        for num in arr {
            counts[num] += 1
        }
        let nums = counts.enumerated().filter { (offset, element) in
            element > 0
        }.map(\.offset)

        let n = nums.count
        for i in 0..<n {
            let numi = nums[i]
            for j in i..<n {
                let numj = nums[j]
                let numk = target - numi - numj
                if numk < 0 || numk > 100 || counts[numk] == 0 {
                    continue
                }
                
                let count = counts[numi]
                print("\(numi)---\(numj)---\(numk)")
                if numi == numj && numj == numk {           // 三个一样
                    res += count * (count - 1) * (count - 2) / 6
                } else if numi == numj && numj != numk {    // 两个一样
                    res += counts[numk] * count * (count - 1) / 2
                } else if numj < numk {                     // 三个都不一样
                    res += counts[numi] * counts[numj] * counts[numk]
                }
            }
        }
        
        return res % 1000_000_007
    }
}