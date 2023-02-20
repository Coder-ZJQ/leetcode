class Solution {
    
    func bestHand(_ ranks: [Int], _ suits: [Character]) -> String {
        let set = Set<Character>(suits)
        if set.count == 1 {
            return "Flush"
        }
        
        var counter = [Int](repeating: 0, count: 14)
        for rank in ranks {
            counter[rank] += 1
        }
        let maxCount = counter.max()!
        if maxCount >= 3 {
            return "Three of a Kind"
        } else if maxCount == 2 {
            return "Pair"
        } else {
            return "High Card"
        }
    }
}
