class Solution {
    
    /// 1_000_000_000 下所有 2 的幂的各位数出现次数字符串的集合
    lazy var all2set: Set<String> = {
        var set = Set<String>()
        var num = 1
        while num <= 1_000_000_000 {
            set.insert(countOfDigits(num))
            num *= 2
        }
        return set
    }()
    
    /// 计算每位数出现的次数，以字符串的形式返回
    private func countOfDigits(_ n: Int) -> String {
        var counts = [Int](repeating: 0, count: 10)
        
        var num = n
        while num > 0 {
            counts[num % 10] += 1
            num /= 10
        }
        
        return counts.map {
            "\($0)"
        }.joined(separator: ".")
    }
    
    /// 1 <= n <= 10 的 9 次方
    func reorderedPowerOf2(_ n: Int) -> Bool {
        all2set.contains(countOfDigits(n))
    }
}
