class CandyBasket {
    private let price: [Int]
    init(_ price: [Int]) {
        self.price = price.sorted()
    }
    
    private func check(_ k: Int, _ tastiness: Int) -> Bool {
        var pre = -tastiness, count = 0
        for cur in price {
            if cur - pre >= tastiness {
                count += 1
                pre = cur
                // 数量已经满足直接返回
                if count >= k { return true }
            }
        }
        return false
    }
    
    func maximumTastiness(_ k: Int) -> Int {
        let n = price.count
        var l = 0, r = price[n - 1] - price[0]
        while l < r {
            let mid = (l + r + 1) >> 1
            if check(k, mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }
    
}

class Solution {
    
    func maximumTastiness(_ price: [Int], _ k: Int) -> Int {
        CandyBasket(price).maximumTastiness(k)
    }
}
