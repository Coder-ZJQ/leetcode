class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        // dp
        var a = 1, e = 1, i = 1, o = 1, u = 1
        var k = 1
        while k < n {
            a += e + i + o + u
            e += i + o + u
            i += o + u
            o += u
//            u = u
            k += 1
        }
        
        return a + e + i + o + u
    }
}