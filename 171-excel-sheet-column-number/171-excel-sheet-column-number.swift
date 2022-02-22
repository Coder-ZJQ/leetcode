class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        columnTitle.reversed().enumerated().reduce(0, { partialResult, next in
            partialResult + Int(next.element.asciiValue! - 64) * Int(pow(26.0, Double(next.offset)))
        })
    }
}
