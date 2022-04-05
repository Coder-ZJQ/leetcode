class Solution {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        (left...right).reduce(0) { partialResult, next in
            (1 << next.nonzeroBitCount) & 0b10100010100010101100 > 0 ? partialResult + 1 : partialResult
        }
    }
}
