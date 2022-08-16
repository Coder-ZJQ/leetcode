class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var indexMap = [Character: Int]()
        for (i, c) in s.enumerated() {
            indexMap[c] = indexMap[c] == nil ? i : Int.max
        }
        let minIndex = indexMap.min {
            $0.value < $1.value
        }?.value
        if let index = minIndex {
            return index == Int.max ? -1 : index
        }
        return -1
    }
}
