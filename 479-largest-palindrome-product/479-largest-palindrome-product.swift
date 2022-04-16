class Solution {
    func largestPalindrome(_ n: Int) -> Int {
        let max = Int(pow(Float(10), Float(n))) - 1,
            min = Int(pow(Float(10), Float(n - 1)))
        
        for i in (min...max).reversed() where i / min == 9 {
            let palindrome = generatePalindrome(i)
            
            var num1 = max
            while num1 * num1 >= palindrome {
                if palindrome % num1 == 0 {
                    return palindrome % 1337
                }
                num1 -= 1
            }
        }
        
        return 9
    }
    
    private func generatePalindrome(_ num: Int) -> Int {
        var palindrome = num, temp = num
        while temp > 0 {
            palindrome = palindrome * 10 + temp % 10
            temp /= 10
        }
        return palindrome
    }
}