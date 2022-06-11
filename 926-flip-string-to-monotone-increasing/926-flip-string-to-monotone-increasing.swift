class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var flips0 = 0, flips1 = 0, count1 = 0
        
        for c in s {
            if c == "0" {
                if count1 > 0 {
                    flips0 += 1
                }
            } else {
                count1 += 1
            }
            
            if flips0 > count1 {
                flips1 += count1
                flips0 = 0
                count1 = 0
            }
            
        }
        
        return flips0 + flips1
    }
}
