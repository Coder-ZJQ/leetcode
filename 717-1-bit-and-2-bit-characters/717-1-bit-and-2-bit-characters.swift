class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        var countOfOne = 0,
            i = bits.count - 2
        
        while i >= 0, bits[i] != 0 {
            i -= 1
            countOfOne += 1
        }
        return countOfOne % 2 == 0
    }
}
