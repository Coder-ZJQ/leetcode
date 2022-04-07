class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        if n > 0 {
            return n % 2 == 0 ? myPow(x * x, n / 2) : x * myPow(x * x, n / 2)
        } else {
            return 1.0 / myPow(x, -n)
        }
    }
}
