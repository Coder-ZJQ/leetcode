class Solution {
    private func digitSum(_ n: Int) -> Int {
        n == 0 ? 0 : (n % 10 + digitSum(n / 10))
    }
    func countLargestGroup(_ n: Int) -> Int {
        // 1 <= n <= 10000, 9999, 4 * 9 + 1
        var counter = [Int](repeating: 0, count: 37)
        for i in 1...n {
            let sum = digitSum(i)
            counter[sum] += 1
        }
        let max = counter.max()!
        return counter.reduce(0) { partialResult, next in
            next == max ? (partialResult + 1) : partialResult
        }
    }
}
