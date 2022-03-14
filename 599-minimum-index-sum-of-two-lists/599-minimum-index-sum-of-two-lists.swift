class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var dict = [String: Int]()
        for (i, r) in list1.enumerated() {
            dict[r] = i
        }
        var res = [String](), minIndexSum = list1.count + list2.count
        for (i, r) in list2.enumerated() {
            if let j = dict[r], i + j <= minIndexSum {
                if i + j == minIndexSum {
                    res.append(r)
                } else {
                    res = [r]
                }
                minIndexSum = i + j
            }
        }
        return res
    }
}
