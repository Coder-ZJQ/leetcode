class Solution {
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        var depth = 0
        var res = [Int]()
        for char in seq {
            if char == "(" {
                depth += 1
                res.append(depth % 2)
            } else {
                res.append(depth % 2)
                depth -= 1
            }
        }
        return res
    }
}
