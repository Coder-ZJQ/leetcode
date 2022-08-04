class Solution {
    /// 最大公约数(greatest common divisor)
    /// https://baike.baidu.com/item/%E6%9C%80%E5%A4%A7%E5%85%AC%E7%BA%A6%E6%95%B0/869308
    /// 辗转相除法
    /// https://baike.baidu.com/item/%E6%AC%A7%E5%87%A0%E9%87%8C%E5%BE%97%E7%AE%97%E6%B3%95/1647675?fromtitle=%E8%BE%97%E8%BD%AC%E7%9B%B8%E9%99%A4%E6%B3%95&fromid=4625352
    private func gcd(_ a: Int, _ b: Int) -> Int {
        guard a != 0 else {
            return b
        }
        return gcd(b % a, a)
    }
    
    func mirrorReflection(_ p: Int, _ q: Int) -> Int {
        let g = gcd(p, q),
            a = p / g % 2,
            b = q / g % 2
        if a == 1 && b == 1 {
            return 1
        }
        return a == 1 ? 0 : 2
    }
}
