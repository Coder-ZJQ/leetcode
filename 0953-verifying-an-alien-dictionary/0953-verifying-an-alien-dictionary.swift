class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard words.count > 1 else {
            return true
        }
        var orderMap = [Character: Int]()
        for (i, char) in order.enumerated() {
            orderMap[char] = i
        }
        var pre = words[0]
        for word in words[1...] {
            var samePrefix = true
            for (charPre, charCur) in zip(pre, word) {
                let orderPre = orderMap[charPre]!,
                    orderCur = orderMap[charCur]!
                if orderPre > orderCur {
                    return false
                } else if orderPre < orderCur {
                    samePrefix = false
                    break
                }
            }
            if samePrefix && pre.count > word.count {
                return false
            }
            pre = word
            
        }
        return true
    }
}
