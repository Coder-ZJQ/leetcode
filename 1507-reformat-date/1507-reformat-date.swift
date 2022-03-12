class Solution {
    func reformatDate(_ date: String) -> String {
        var split = date.split(separator: " ").map({
            String($0)
        })
        let month = ["Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04", "May": "05", "Jun": "06", "Jul": "07", "Aug": "08", "Sep": "09", "Oct": "10", "Nov": "11", "Dec": "12"]
        split[1] = month[split[1]] ?? ""
        var day = split[0]
        if day.count == 3 {
            day = "0" + day
        }
        split[0] = String(day.prefix(2))
        return split.reversed().joined(separator: "-")
    }
}
