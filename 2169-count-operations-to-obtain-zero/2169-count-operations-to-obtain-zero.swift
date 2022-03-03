class Solution {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        var num1 = num1, num2 = num2, count = 0
        while num1 != 0 && num2 != 0 {
            if num1 > num2 {
                count += num1 / num2
                num1 %= num2
            } else {
                count += num2 / num1
                num2 %= num1
            }
        }
        return count
    }
}