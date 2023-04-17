class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max() ?? 0
        return candies.map { candie in
            return candie + extraCandies >= max
        }
    }
}