class Solution {
    func defangIPaddr(_ address: String) -> String {
        address.split(separator: ".").joined(separator: "[.]")
    }
}