class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        guard k != 0 else {
            return [Int](repeating: 0, count: n)
        }
        
        return (0..<n).map { index in
            if k > 0 {
                var sum = 0
                for i in (index + 1)...(index + k) {
                    sum += code[i % n]
                }
                return sum
            } else {
                var sum = 0
                for i in (index + k)..<index {
                    sum += code[(n + i) % n]
                }
                return sum
            }
        }
    }
}
