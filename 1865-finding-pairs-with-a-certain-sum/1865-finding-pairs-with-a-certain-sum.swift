class FindSumPairs {
    
    var nums1Counts: [Int: Int]
    var nums2Counts: [Int: Int]
    var nums2: [Int]

    init(_ nums1: [Int], _ nums2: [Int]) {
        nums1Counts = [:]
        nums2Counts = [:]
        self.nums2 = nums2
        for num in nums1 {
            nums1Counts[num] = nums1Counts[num, default: 0] + 1
        }
        for num in nums2 {
            nums2Counts[num] = nums2Counts[num, default: 0] + 1
        }
    }
    
    func add(_ index: Int, _ val: Int) {
        let old = nums2[index],
            new = old + val
        nums2[index] = new
        
        nums2Counts[old]! -= 1
        nums2Counts[new] = nums2Counts[new, default: 0] + 1
    }
    
    func count(_ tot: Int) -> Int {
        var sum = 0
        for num in nums1Counts.keys {
            guard let count = nums2Counts[tot - num] else { continue }
            sum += (count * nums1Counts[num]!)
        }
        return sum
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * let obj = FindSumPairs(nums1, nums2)
 * obj.add(index, val)
 * let ret_2: Int = obj.count(tot)
 */