class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        // 101010
        //  10101
        let shiftRight = n >> 1,
        // 111111
        xor = shiftRight ^ n
        
        return xor & (xor + 1) == 0
    }
}
