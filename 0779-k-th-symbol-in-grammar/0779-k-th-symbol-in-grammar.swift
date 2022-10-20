class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        (k - 1).nonzeroBitCount & 1
    }
}
