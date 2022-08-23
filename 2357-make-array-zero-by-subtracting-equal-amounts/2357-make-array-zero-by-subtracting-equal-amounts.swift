class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        Set(nums).filter {
            $0 != 0
        }.count
    }
}
