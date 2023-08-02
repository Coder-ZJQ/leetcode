class Solution {
    
    private var nums = [Int]()
    private var res = [[Int]]()
    private var visited = Set<Int>()
    
    private func backtrack(_ array: inout [Int]) {
        if array.count == nums.count {
            res.append(array)
        } else {
            for num in nums where !visited.contains(num){
                visited.insert(num)
                array.append(num)
                backtrack(&array)
                array.removeLast()
                visited.remove(num)
            }
        }
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        self.nums = nums
        var array = [Int]()
        backtrack(&array)
        return res
    }
}
