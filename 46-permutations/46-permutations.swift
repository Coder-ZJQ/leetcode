class Solution {
    private var _res = [[Int]]()
    private var _visited = Set<Int>()
    
    private func _backtrack(_ nums: [Int], _ array: inout [Int]) {
        if array.count == nums.count {
            _res.append(array)
        } else {
            for num in nums where !_visited.contains(num) {
                _visited.insert(num)
                array.append(num)
                _backtrack(nums, &array)
                // 回溯移除
                array.removeLast()
                _visited.remove(num)
            }
        }
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var array = [Int]()
        _backtrack(nums, &array)
        return _res
    }
}
