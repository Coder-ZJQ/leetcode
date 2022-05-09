class Solution {
    func diStringMatch(_ s: String) -> [Int] {
        var result = [Int]()
        var min = 0, max = s.count
        for char in s {
            if char == "D" {
                result.append(max)
                max -= 1
            } else {
                result.append(min)
                min += 1
            }
        }
        result.append(min)
        return result
    }
}