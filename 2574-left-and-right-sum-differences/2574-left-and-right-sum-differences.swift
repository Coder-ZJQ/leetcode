class Solution {
    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        var leftSum = [Int](), rightSum = [Int]()
        var sum = 0
        for num in nums {
            leftSum.append(sum)
            sum += num
        }
        sum = 0
        for num in nums.reversed() {
            rightSum.append(sum)
            sum += num
        }
        return zip(leftSum, rightSum.reversed()).map {
            abs($0 - $1)
        }
        
    }
}
