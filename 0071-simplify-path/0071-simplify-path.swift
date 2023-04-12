class Solution {
    func simplifyPath(_ path: String) -> String {
        let split = path.split(separator: "/")
        var stack = [String]()
        for path in split where !path.isEmpty {
            if path == ".." {
                stack.popLast()
            } else if path != "." {
                stack.append(String(path))
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}
