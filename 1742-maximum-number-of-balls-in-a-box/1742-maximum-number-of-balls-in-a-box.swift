class Solution {
    func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
        // 1 ~ 100000, 所以盒子编号最大为 45(99999)
        var box = [Int](repeating: 0, count: 46)
        for i in lowLimit...highLimit {
            var sum = 0, num = i
            while num > 0 {
                sum += num % 10
                num /= 10
            }
            box[sum] += 1
        }
        return box.max()!
    }
}
