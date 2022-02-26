class Solution {
    func countEven(_ num: Int) -> Int {
        let sum = num % 10 + (num / 10) % 10 + (num / 100) % 10 + (num / 1000) % 10
        return (num - 1) / 2 + (sum % 2 == 0 && num % 2 == 0 ? 1 : 0)
    }
}