class Solution {
    func average(_ salary: [Int]) -> Double {
        var min = Int.max, max = 0, sum = 0
        for num in salary {
            sum += num
            if num < min {
                min = num
            }
            if num > max {
                max = num
            }
        }
        return Double(sum - min - max) / Double(salary.count - 2)
    }
}