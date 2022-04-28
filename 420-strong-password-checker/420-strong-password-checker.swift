class Solution {
    
    /// 1. 长度 6-20
    /// 2. 包含小写字母、大写字母、数字
    /// 3. 同一字符不能连续出现三次
    
    func strongPasswordChecker(_ password: String) -> Int {
        var containsNumber = 0,
            containsLower = 0,
            containsUpper = 0
        for char in password {
            if char.isLetter {
                if char.isUppercase {
                    containsUpper = 1
                } else if char.isLowercase {
                    containsLower = 1
                }
            } else if char.isNumber {
                containsNumber = 1
            }
        }
        
        let n = password.count
        
        // 已满足的条件
        let satisfied = containsNumber + containsLower + containsUpper
        
        if n < 6 {
            // 长度小于 6 时，优先执行插入操作
            return max(6 - n, 3 - satisfied)
        } else if n <= 20 {
            // 长度在 6 至 20 之间时，优先执行替换操作
            var replace = 0,
                count = 0,
                pre: Character = "#"
            for char in password {
                if char == pre {
                    count += 1
                } else {
                    replace += count / 3
                    count = 1
                }
                pre = char
            }
            replace += count / 3
            return max(replace, 3 - satisfied)
        } else {
            
            var replace = 0,
                count = 0,
                counts = [Int](repeating: 0, count: 3),
                pre: Character = "#"
            for char in password {
                if char == pre {
                    count += 1
                } else {
                    if count >= 3 {
                        replace += count / 3
                        counts[count % 3] += 1
                    }
                    count = 1
                }
                pre = char
            }
            if count >= 3 {
                replace += count / 3
                counts[count % 3] += 1
            }
            var shouldRemove = n - 20,
                remaining = shouldRemove
            for i in 0...2 {
                if i == 2 {
                    counts[i] = replace
                }
                if counts[i] > 0 && remaining > 0 {
                    let temp = min(counts[i] * (i + 1), remaining)
                    remaining -= temp
                    replace -= temp / (i + 1)
                }
            }
            return shouldRemove + max(replace, 3 - satisfied)
        }
    }
}