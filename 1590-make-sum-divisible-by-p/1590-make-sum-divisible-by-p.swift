class Solution {
    /*
     x y z
     p

     1.
         y mod p = x
         (y - z) mod p = 0
         ↓
         z mod p = x

     2.
         (y - z) mod p = x
         ↓
         z mod p = (y - x) mod p

     */
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        var x = 0
        for num in nums {
            x = (x + num) % p
        }
        if x == 0 {
            return 0
        }
        let n = nums.count
        var res = n, map = [Int: Int](), y = 0
        for i in 0..<n {
            map[y] = i
            y = (y + nums[i]) % p
            if let j = map[(y - x + p) % p] {
                res = min(res, i - j + 1)
            }
        }
        
        return res == n ? -1 : res
    }
}
