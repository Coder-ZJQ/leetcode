class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var strings = [String](repeating: "", count: numRows)
        for (i, c) in s.enumerated() {
            let position = i % (numRows * 2 - 2)
            let index = position / numRows == 0 ? position % numRows : (numRows * 2 - 2) - position
            strings[index].append(c)
        }
        return strings.joined()
    }
}