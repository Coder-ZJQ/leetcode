class Solution {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        var less = [Int](), equal = [Int](), greater = [Int]()
        for num in nums {
            if num > pivot {
                greater.append(num)
            } else if num < pivot {
                less.append(num)
            } else {
                equal.append(num)
            }
        }
        return less + equal + greater
    }
}
