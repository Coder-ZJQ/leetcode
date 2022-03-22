class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var array = [UInt8](repeating: 1, count: n)
        var k = k - n, i = n - 1
        while k > 0 && i >= 0 {
            if k >= 25 {
                array[i] += 25
                k -= 25
            } else {
                array[i] += UInt8(k)
                break
            }
            i -= 1
        }
        return String(array.map {
            Character(Unicode.Scalar($0 + 96))
        })
    }
}

