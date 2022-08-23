class Solution {
    func mergeSimilarItems(_ items1: [[Int]], _ items2: [[Int]]) -> [[Int]] {
        var mapper = [Int: Int]()
        for item in items1 + items2 {
            let value = item[0]
            mapper[value] = mapper[value, default: 0] + item[1]
        }
        return mapper.sorted {
            $0.key < $1.key
        }.map {
            [$0.key, $0.value]
        }
    }
}
