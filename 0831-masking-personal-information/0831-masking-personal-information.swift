class Solution {
    func maskPII(_ s: String) -> String {
        if let atIndex = s.firstIndex(of: "@") {
            let email = "\(s.first!)*****" + String(s[s.index(before: atIndex)...])
            return email.lowercased()
        } else {
            let phone = String(s.filter { char in
                let asciiValue = char.asciiValue ?? 0
                return asciiValue >= 48 && asciiValue <= 57
            })
            let length = phone.count
            guard length >= 10 && length <= 13 else {
                return ""
            }
            return ["", "+*-", "+**-", "+***-"][length - 10] + "***-***-" + phone[phone.index(phone.startIndex, offsetBy: length - 4)...]
        }
    }
}