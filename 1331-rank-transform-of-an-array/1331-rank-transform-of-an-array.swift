class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var i = 1, dict = [Int: Int]()
        for num in arr.sorted() {
            if dict[num] == nil {
                dict[num] = i
                i += 1
            }
        }
        return arr.map {
            dict[$0]!
        }
    }
}
