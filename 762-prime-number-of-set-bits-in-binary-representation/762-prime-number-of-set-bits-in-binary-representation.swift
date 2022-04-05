class Solution {
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
        let set = Set([2, 3, 5, 7, 11, 13, 17, 19])
        return (left...right).reduce(0) { partialResult, next in
            set.contains(next.nonzeroBitCount) ? partialResult + 1 : partialResult
        }
    }
}