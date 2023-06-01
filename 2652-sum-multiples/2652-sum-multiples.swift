class Solution {
    func sumOfMultiples(_ n: Int) -> Int {
        (1...n).reduce(0) {
            $1 % 3 == 0 || $1 % 5 == 0 || $1 % 7 == 0 ? $0 + $1 : $0
        }
    }
}
