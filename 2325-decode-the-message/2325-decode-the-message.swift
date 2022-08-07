class Solution {
    func decodeMessage(_ key: String, _ message: String) -> String {
        var mapper = [Character: Character]()
        let chars = [Character]("abcdefghijklmnopqrstuvwxyz")
        var cur = 0
        for char in key where char != " " && mapper[char] == nil {
            mapper[char] = chars[cur]
            cur += 1
        }
        let mapped = message.map {
            $0 == " " ? $0 : mapper[$0]!
        }
        return String(mapped)
    }
}