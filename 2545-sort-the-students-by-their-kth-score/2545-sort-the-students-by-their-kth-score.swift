class Solution {
    func sortTheStudents(_ score: [[Int]], _ k: Int) -> [[Int]] {
        score.enumerated().sorted {
            $0.element[k] > $1.element[k]
        }.map(\.offset).map {
            score[$0]
        }
    }
}