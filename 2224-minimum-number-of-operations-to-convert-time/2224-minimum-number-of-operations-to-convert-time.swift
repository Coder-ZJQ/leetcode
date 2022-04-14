class Solution {
    func convertTime(_ current: String, _ correct: String) -> Int {
        let timeCurrent = current.split(separator: ":")
        let timeCorrect = correct.split(separator: ":")
        let minutesCurrent = Int(timeCurrent[0])! * 60 + Int(timeCurrent[1])!
        let minutesCorrect = Int(timeCorrect[0])! * 60 + Int(timeCorrect[1])!
        var diffMinutes = minutesCorrect - minutesCurrent
        var res = 0
        res += diffMinutes / 60
        diffMinutes %= 60
        res += diffMinutes / 15
        diffMinutes %= 15
        res += diffMinutes / 5
        diffMinutes %= 5
        res += diffMinutes
        return res
    }
}
