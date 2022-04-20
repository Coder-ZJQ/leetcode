class Solution {
    func lengthLongestPath(_ input: String) -> Int {
        let array = input.split(separator: "\n").map { substring -> (String, Int) in
            var str = String(substring)
            str.removeAll { char in
                char == "\t"
            }
            return (str, substring.count - str.count)
        }
        var stack = [String](), res = 0
        for path in array {
            while stack.count > path.1 {
                stack.removeLast()
            }
            stack.append(path.0)
            
            if path.0.contains(".") {
                let length = stack.reduce(0) { partialResult, next in
                    partialResult + next.count
                } + stack.count - 1
                res = max(res, length)
            }
        }
        return res
    }
}
