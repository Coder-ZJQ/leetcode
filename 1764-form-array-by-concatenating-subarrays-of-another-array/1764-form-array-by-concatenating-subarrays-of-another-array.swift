extension Array {
    public typealias Element = Int
    var string: String {
        "*" + self.map {
            "\($0)"
        }.joined(separator: "*") + "*"
    }
}

class Solution {
    func canChoose(_ groups: [[Int]], _ nums: [Int]) -> Bool {
        let strings = groups.map(\.string)
        var match = nums.string
        for string in strings {
            if let index = match.range(of: string) {
                match = String(match[match.index(before: index.upperBound)...])
            } else {
                return false
            }
        }
        return true
    }
}