class Solution {
    
    private var _res = [[Int]]()
    private var _nums = [Int]()
    
    private func _backtrack(_ visited: inout [Bool],_ array: inout [Int]) {
        if array.count == _nums.count {
            _res.append(array)
        } else {
            for i in 0..<_nums.count {
                // 限制同一位置重复访问
                if visited[i] ||
                    // 限制使用同一数字
                    (i > 0 && _nums[i] == _nums[i - 1] && visited[i - 1]) {
                    continue
                }
                visited[i] = true
                array.append(_nums[i])
                _backtrack(&visited, &array)
                // 回溯恢复
                visited[i] = false
                array.removeLast()
            }
        }
    }
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        // 排序，使重复的数字都相邻
        _nums = nums.sorted()
        var visited = [Bool](repeating: false, count: _nums.count),
            array = [Int]()
        _backtrack(&visited, &array)
        return _res
    }
}
