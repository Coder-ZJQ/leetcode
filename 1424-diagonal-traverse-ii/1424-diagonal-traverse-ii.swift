class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        let total = nums.count + nums.max(by: {
            $0.count < $1.count
        })!.count - 1
        var arrays = [[Int]](repeating: [], count: total)
        for i in 0..<nums.count {
            let array = nums[i]
            for j in 0..<array.count {
                arrays[i + j].append(array[j])
            }
        }
        var res = [Int]()
        for array in arrays {
            for i in (0..<array.count).reversed() {
                res.append(array[i])
            }
        }
        return res
    }
}
