class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        guard students.reduce(0, +) != sandwiches.reduce(0, +) else {
            return 0
        }
        var students = students
        for sandwich in sandwiches {
            if let index = students.firstIndex(of: sandwich) {
                students.remove(at: index)
            } else {
                return students.count
            }
        }
        return students.count
    }
}
