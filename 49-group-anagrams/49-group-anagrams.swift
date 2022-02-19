class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()
        for str in strs {
            let key = generateKey(str)
            dict[key] = dict[key, default: []] + [str]
        }
        return Array(dict.values)
    }
    private func generateKey(_ str: String) -> String {
        return String(str.sorted())
    }
}