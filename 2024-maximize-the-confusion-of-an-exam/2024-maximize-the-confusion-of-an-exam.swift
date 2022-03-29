class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let answerChars = [Character](answerKey),
            n = answerChars.count
        var start = 0, res = 0, count = 0
        // T -> F
        for end in 0..<n {
            if answerChars[end] == "T" {
                count += 1
            }
            while count > k {
                if answerChars[start] == "T" {
                    count -= 1
                }
                start += 1
            }
            res = max(res, end - start + 1)
        }
        start = 0
        count = 0
        // F -> T
        for end in 0..<n {
            if answerChars[end] == "F" {
                count += 1
            }
            while count > k {
                if answerChars[start] == "F" {
                    count -= 1
                }
                start += 1
            }
            res = max(res, end - start + 1)
        }
        return res
    }
}
