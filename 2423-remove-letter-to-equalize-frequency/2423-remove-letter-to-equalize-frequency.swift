class Solution {
    func equalFrequency(_ word: String) -> Bool {
        var frequency = [Int](repeating: 0, count: 26)
        for char in word {
            let index = Int(char.asciiValue!) - 97
            frequency[index] += 1
        }
        frequency = frequency.filter({ $0 > 0 })
        if let min = frequency.min(), min == 1 {
            frequency.remove(at: frequency.firstIndex(of: min)!)
            if Set(frequency).count == 1 {
                return true
            }
            // 恢复现场
            frequency.append(1)
        }
        if let max = frequency.max() {
            let i = frequency.firstIndex(of: max)!
            frequency[i] = max - 1
            if Set(frequency).count == 1 {
                return true
            }
        }
        return false
    }
}