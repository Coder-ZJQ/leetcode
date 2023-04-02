class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let potions = potions.sorted()
        
        return spells.map { spell in
            var l = 0, r = potions.count - 1
            while l <= r {
                let mid = (r + l) / 2
                let product = potions[mid] * spell
                if product >= success {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            return potions.count - l
        }
    }
}