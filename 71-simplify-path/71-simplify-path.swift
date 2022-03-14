class Solution {
    func simplifyPath(_ path: String) -> String {
        let split = path.split(separator: "/")
        var stack = [String]()
        for path in split {
            guard path.count > 0 else { continue }
            if path == ".." {
                if let _ = stack.last {
                    stack.removeLast()
                }
            } else if path != "." {
                stack.append(String(path))
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}