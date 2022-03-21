class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
        let chars = [Character](colors),
            n = chars.count
        guard n > 2 else { return false }
        var a = 0, b = 0
        for i in 2..<n {
            let left = chars[i - 2],
            mid = chars[i - 1],
            right = chars[i]
            if left == "A" && mid == "A" && right == "A" {
                a += 1
            } else if left == "B" && mid == "B" && right == "B" {
                b += 1
            }
        }
        return a > b
    }
}
