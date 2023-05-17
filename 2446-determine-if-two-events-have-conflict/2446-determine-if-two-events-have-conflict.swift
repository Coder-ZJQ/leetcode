class Solution {
    func haveConflict(_ event1: [String], _ event2: [String]) -> Bool {
        !(event1[1] < event2[0] || event2[1] < event1[0])
    }
}
