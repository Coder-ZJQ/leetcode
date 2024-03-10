class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var countsA = [Int](repeating: 0, count: 10),
            countsB = [Int](repeating: 0, count: 10)
        var countBull = 0
        for (a, b) in zip(secret, guess) {
            if a == b {
                countBull += 1
            } else if let asciiValueA = a.asciiValue, let asciiValueB = b.asciiValue {
                countsA[Int(asciiValueA) - 48] += 1
                countsB[Int(asciiValueB) - 48] += 1
            }
        }
        let countCow = zip(countsA, countsB).reduce(0) {
            $0 + min($1.0, $1.1)
        }
        return "\(countBull)A\(countCow)B"
    }
}