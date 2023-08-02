class Solution {
    func flipgame(_ fronts: [Int], _ backs: [Int]) -> Int {
        var res = 2001, same = Set<Int>()
        for (front, back) in zip(fronts, backs) where front == back {
            same.insert(front)
        }
        for num in fronts where !same.contains(num) && num < res {
            res = num
        }
        for num in backs where !same.contains(num) && num < res {
            res = num
        }
        return res == 2001 ? 0 : res
    }
}
