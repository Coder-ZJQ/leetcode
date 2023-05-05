class Solution {
    func hardestWorker(_ n: Int, _ logs: [[Int]]) -> Int {
        var res = logs[0][0], maxTime = logs[0][1]
        for i in 1..<logs.count {
            let log = logs[i],
                id = log[0],
                time = log[1] - logs[i - 1][1]
            
            if time > maxTime || (time == maxTime && res > id){
                res = id
                maxTime = time
            }
        }
        return res
    }
}
