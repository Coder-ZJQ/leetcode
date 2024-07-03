class Solution {
    
    private func sumOfTheDigitsOf(_ x: Int) -> Int {
        var sum = 0, num = x
        while num > 0 {
            sum += num % 10
            num /= 10
        }
        return sum
    }
    
    func sumOfTheDigitsOfHarshadNumber(_ x: Int) -> Int {
        let sum = sumOfTheDigitsOf(x)
        return x % sum == 0 ? sum : -1
    }
}