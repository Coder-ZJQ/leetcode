class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var array = [Int](repeating: 1, count: n)
        var k = k - n, i = n - 1
        while k > 0 && i >= 0 {
            if k >= 25 {
                array[i] += 25
                k -= 25
            } else {
                array[i] += k
                break
            }
            i -= 1
        }
        let chars = [Character]("abcdefghijklmnopqrstuvwxyz")
        return String(array.map {
            chars[$0 - 1]
        })
    }
}
