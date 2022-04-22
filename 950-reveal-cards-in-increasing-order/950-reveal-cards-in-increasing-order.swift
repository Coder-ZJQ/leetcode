class Solution {
    
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        let n = deck.count
        let sorted = deck.sorted()
        var res = [Int](repeating: 0, count: n)
        var queue = [Int](0..<n)
        for i in 0..<n {
            res[queue.removeFirst()] = sorted[i]
            if !queue.isEmpty {
                queue.append(queue.removeFirst())
            }
        }
        return res
    }
    
}