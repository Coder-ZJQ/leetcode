class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        // 数量超过一个才比较，否则直接返回 true
        guard words.count > 1 else { return true }
        // 字母及顺序映射
        var orderDict = [Character: Int]()
        for (index, char) in order.enumerated() {
            orderDict[char] = index
        }
        
        for i in 1..<words.count {
            let pre = words[i - 1],
                cur = words[i]
            // 是否有相同前缀
            var samePrefix = true
            for (c1, c2) in zip(pre, cur) {
                let order1 = orderDict[c1]!,
                    order2 = orderDict[c2]!
                if order1 > order2 {
                    return false
                } else if order1 < order2 {
                    samePrefix = false
                    break
                }
            }
            if samePrefix && pre.count > cur.count {
                return false
            }
        }
        
        return true
    }
}