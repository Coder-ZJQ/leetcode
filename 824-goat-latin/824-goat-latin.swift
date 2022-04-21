class Solution {
    func toGoatLatin(_ sentence: String) -> String {
        sentence
            .split(separator: " ")
            .enumerated()
            .map { (index, string) in
                var string = String(string)
                let first = string.first!,
                    lower = first.lowercased().first!
                if lower != "a" && lower != "e" && lower != "i" && lower != "o" && lower != "u" {
                    string.append(string.removeFirst())
                }
                string += "ma"
                string += String([Character](repeating: "a", count: index + 1))
                return string
            }
            .joined(separator: " ")
    }
}
