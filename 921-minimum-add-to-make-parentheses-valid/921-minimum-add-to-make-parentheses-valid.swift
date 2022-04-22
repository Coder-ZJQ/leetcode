class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var open = 0, close = 0
        for c in s {
            if c == "(" {
                open += 1
            } else {
                if open > 0 {
                    open -= 1
                } else {
                    close += 1
                }
            }
        }
        return open + close
    }
}
