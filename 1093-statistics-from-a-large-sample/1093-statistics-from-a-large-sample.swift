class Solution {
    func sampleStats(_ count: [Int]) -> [Double] {
        var sum = 0, total = 0, minimum = -1, maximum = 0, maxFreq = 0, mode = 0
        for (i, cnt) in count.enumerated() where cnt > 0 {
            if minimum == -1 {
                minimum = i
            }
            if cnt > maxFreq {
                maxFreq = cnt
                mode = i
            }
            sum += i * cnt
            total += cnt
            maximum = i
        }
        
        let mid = total / 2
        let (index0, index1) = total % 2 == 1 ? (mid, mid) : (mid - 1, mid)
        
        var curCnt = 0, median: Double = 0.0
        for (i, cnt) in count.enumerated() where cnt > 0 {
            if index0 >= curCnt && index0 < curCnt + cnt {
                median += Double(i)
            }
            if index1 >= curCnt && index1 < curCnt + cnt {
                median += Double(i)
                median /= 2.0
                break
            }
            curCnt += cnt
        }
        
        return [Double(minimum), Double(maximum), Double(sum) / Double(total), median, Double(mode)]
    }
}