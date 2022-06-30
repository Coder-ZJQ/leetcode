class Solution {
    
    private func countPrime(_ n: Int) -> Int {
        guard n >= 2 else { return 0 }
        var isPrimes = [Bool](repeating: true, count: n + 1)
        var count = 0
        for i in 2..<isPrimes.count {
            if isPrimes[i] {
                count += 1
                var j = 2
                while i * j <= n {
                    isPrimes[i * j] = false
                    j += 1
                }
            }
        }
        return count
    }
    
    private func factorial(_ n: Int) -> Int {
        (1...n).reduce(1) { partialResult, num in
            partialResult * num % 1_000_000_007
        }
    }
    
    func numPrimeArrangements(_ n: Int) -> Int {
        guard n >= 2 else { return 1 }
        let countPrime = countPrime(n)
        return factorial(countPrime) * factorial(n - countPrime) % 1_000_000_007
    }
}