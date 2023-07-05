class Solution {
    func kItemsWithMaximumSum(_ numOnes: Int, _ numZeros: Int, _ numNegOnes: Int, _ k: Int) -> Int {
        if k < numOnes {
            return k
        } else if k <= numOnes + numZeros {
            return numOnes
        } else {
            return numOnes - (k - numOnes - numZeros)
        }
    }
}
