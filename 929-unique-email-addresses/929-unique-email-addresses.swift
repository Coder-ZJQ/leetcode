class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var set = Set<String>()
        for email in emails {
            let splits = email.split(separator: "@")
            var name = splits[0]
            if let index = name.firstIndex(of: "+") {
                name = name[name.startIndex..<index]
            }
            name.removeAll(where: { $0 == "." })
            set.insert(name + "@" + splits[1])
        }
        return set.count
    }
}