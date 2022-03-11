/** 
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return 	     -1 if the picked number is lower than your guess number
 *			      1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int 
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var left = 1, right = n
        while left < right {
            let mid = left + (right - left) / 2
            let guess = guess(mid)
            if guess == 0 {
                return mid
            } else if guess == -1 {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}