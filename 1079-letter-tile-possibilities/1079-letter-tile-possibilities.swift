class Solution {
    
    private var counts = [Int](repeating: 0, count: 26)
    
    private func backtrack() -> Int {
        var sum = 0
        for i in 0..<26 where counts[i] > 0 {
            sum += 1
            counts[i] -= 1
            sum += backtrack()
            counts[i] += 1
        }
        return sum
    }
    
    func numTilePossibilities(_ tiles: String) -> Int {
        for tile in tiles {
            counts[Int(tile.asciiValue!) - 65] += 1
        }
        return backtrack()
    }
}
