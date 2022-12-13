class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        var bit: Int32 = 0
        let all: Int32 = 1 << 26 - 1
        for char in sentence {
            bit |= 1 << (char.asciiValue! - 97)
            if bit == all {
                return true
            }
        }
        return false
    }
}
