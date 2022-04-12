class Solution {
    func numberOfLines(_ widths: [Int], _ s: String) -> [Int] {
        var line = 1, last = 0
        for c in s {
            let index = Int(c.asciiValue!) - 97
            let width = widths[index]
            if last + width > 100 {
                last = width
                line += 1
            } else {
                last += width
            }
        }
        return [line, last]
    }
}
