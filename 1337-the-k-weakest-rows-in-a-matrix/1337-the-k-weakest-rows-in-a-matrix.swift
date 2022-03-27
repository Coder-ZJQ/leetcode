class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        mat.map { nums -> Int in
            var sum = 0
            for num in nums {
                guard num == 1 else { break }
                sum += 1
            }
            return sum
        }.enumerated().sorted { pre, nxt in
            pre.element < nxt.element
        }[0..<k].map(\.offset)
    }
}