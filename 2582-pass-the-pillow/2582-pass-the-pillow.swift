class Solution {
    func passThePillow(_ n: Int, _ time: Int) -> Int {
        /// 完整传递一轮所需的次数
        let oneTurnTime = n - 1
        /// 传递多少轮
        let turns = time / oneTurnTime
        /// 完整传递几轮后剩下的次数
        let restTime = time % oneTurnTime
        return turns % 2 == 1 ? n - restTime : 1 + restTime
    }
}