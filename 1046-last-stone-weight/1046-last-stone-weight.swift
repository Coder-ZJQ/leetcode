class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sorted = stones.sorted()
        while sorted.count > 1 {
            let diff = sorted.removeLast() - sorted.removeLast()
            if diff > 0 {
                if let index = sorted.firstIndex(where: { $0 >= diff }) {
                    sorted.insert(diff, at: index)
                } else {
                    sorted.append(diff)
                }
            }
        }
        return sorted.last ?? 0
    }
}