class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        guard cardPoints.count > k else {
            return cardPoints.reduce(0, +)
        }
        
        var sumLeft = cardPoints[..<k].reduce(0, +),
            sumRight = 0
        var res = sumLeft + sumRight
        
        let n = cardPoints.count
        for i in (0..<k).reversed() {
            sumLeft -= cardPoints[i]
            sumRight += cardPoints[n - k + i]
            res = max(res, sumLeft + sumRight)
        }
        
        return res
    }
}
