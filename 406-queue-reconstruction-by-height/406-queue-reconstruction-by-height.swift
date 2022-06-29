class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let people = people.sorted {
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            return $0[0] < $1[0]
        }
        let n = people.count
        var res = [[Int]](repeating: [], count: n)
        for person in people {
            var space = person[1] + 1
            for i in 0..<n where res[i].isEmpty {
                space -= 1
                if space == 0 {
                    res[i] = person
                    break
                }
            }
        }
        return res
    }
}
