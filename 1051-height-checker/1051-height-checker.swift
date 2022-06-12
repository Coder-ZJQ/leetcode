class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        let sorted = heights.sorted(by: <)
        return heights.enumerated().reduce(0, { partialResult, student in
            partialResult + (student.element != sorted[student.offset] ? 1 : 0)
        })
    }
}
