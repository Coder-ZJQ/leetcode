class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var sum = s.map { char in
            "\(char.asciiValue! - 96)"
        }.joined().reduce(0, { partialResult, char in
            partialResult + Int(char.asciiValue! - 48)
        })
        
        var k = k - 1
        while sum > 9 && k > 0 {
            var num = sum, tempSum = 0
            while num > 0 {
                tempSum += num % 10
                num /= 10
            }
            sum = tempSum
            k -= 1
        }
        return sum
    }
}