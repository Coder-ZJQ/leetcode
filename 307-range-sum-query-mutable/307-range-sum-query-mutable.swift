class BIT {
    
    /// 二叉索引树（树状数组）：binary index tree
    private var bit: [Int]
    
    init(_ nums: [Int]) {
        let n = nums.count
        bit = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            update(i, nums[i])
        }
    }
    
    
    func update(_ index: Int, _ val: Int) {
        let n = bit.count
        var idx = index + 1
        while idx < n {
            bit[idx] += val
            idx += idx & (-idx)
        }
    }
    
    func sum(_ i: Int) -> Int {
        var sum = 0, idx = i + 1
        while idx > 0 {
            sum += bit[idx]
            idx -= idx & (-idx)
        }
        return sum
    }
}

class NumArray {
    
    private var nums: [Int]
    private var bit: BIT

    init(_ nums: [Int]) {
        self.nums = nums
        bit = BIT(nums)
    }
    
    func update(_ index: Int, _ val: Int) {
        let update = val - nums[index]
        nums[index] = val
        bit.update(index, update)
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        bit.sum(right) - bit.sum(left - 1)
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */