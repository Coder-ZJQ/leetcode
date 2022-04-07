class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let n = nums.count
        guard n >= 4 else { return [] }
        let sorted = nums.sorted()
        var res = Set<[Int]>()
        
        for i in 0..<(n - 3) {
            let num1 = sorted[i]
            for j in (i + 1)..<(n - 2) {
                let num2 = sorted[j]
                var left = j + 1, right = n - 1
                while left < right {
                    let num3 = sorted[left], num4 = sorted[right]
                    let sum = num1 + num2 + num3 + num4
                    if sum > target {
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        res.insert([num1, num2, num3, num4])
                        left += 1
                        right -= 1
                    }
                }
            }
        }
        return Array(res)
    }
}
