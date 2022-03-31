class Solution {
    private func isSelfDividing(_ number: Int) -> Bool {
        var num = number
        while num > 0 {
            let mod = num % 10
            // 不能被 10 整除，余数不能大于 0 
            if mod == 0 || number % mod != 0 {
                return false
            }
            num /= 10
        }
        return true
    }
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var res = [Int]()
        for num in left...right {
            if isSelfDividing(num) {
                res.append(num)
            }
        }
        return res
    }
}
