class Solution {
    func platesBetweenCandles(_ s: String, _ queries: [[Int]]) -> [Int] {
        let chars = [Character](s),
            n = s.count
        var left = [Int](repeating: -1, count: n + 1),         // 对应位置最左边的蜡烛索引
            right = [Int](repeating: -1, count: n + 1),        // 对应位置最右边的蜡烛索引
            candleCount = [Int](repeating: 0, count: n + 1)   // 对应位置的蜡烛总数
        var candle = -1,
            count = 0
        for i in 0..<n {
            if chars[i] == "|" {
                candle = i
                count += 1
            }
            left[i] = candle
            candleCount[i] = count
        }
        candle = -1
        for i in (0..<n).reversed() {
            if chars[i] == "|" {
                candle = i
            }
            right[i] = candle
        }
        
        var res = [Int]()
        for query in queries {
            let l = query[0],
                r = query[1],
                leftCandle = right[l],
                rightCandle = left[r]
            
            if leftCandle == -1 || rightCandle == -1 {
                res.append(0)
            } else {
                let plate = rightCandle - leftCandle
                if plate > 1 {
                    res.append(plate + 1 - (candleCount[rightCandle] - candleCount[leftCandle] + 1))
                } else {
                    res.append(0)
                }
            }
        }
        return res
    }
}
