extension Int {
    var reversed: Int {
        Int(String("\(self)".reversed()))!
    }
}

class Solution {
    func countDistinctIntegers(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            set.insert(num)
            set.insert(num.reversed)
        }
        return set.count
    }
}
