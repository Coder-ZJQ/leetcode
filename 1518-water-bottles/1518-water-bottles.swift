class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var full = numBottles, empty = 0, res = 0
        while full > 0 {
            // 累加喝掉的瓶数
            res += full
            // 喝掉后累加空瓶
            empty += full
            // 空瓶换成水瓶
            full = empty / numExchange
            // 剩下的空瓶
            empty %= numExchange
        }
        return res
    }
}
