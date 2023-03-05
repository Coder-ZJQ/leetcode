class Solution {
    func minOperationsMaxProfit(_ customers: [Int], _ boardingCost: Int, _ runningCost: Int) -> Int {
        let n = customers.count
        /// 排队索引
        var index = 0
        /// 排队等待乘坐的乘客
        var waitCustomer = 0
        /// 当前收益
        var profit = 0
        /// 最大收益
        var maxProfit = 0
        /// 最小轮转次数
        var minOperations = -1
        while waitCustomer > 0 || index < n {
            // 还有乘客的话追加到等待乘客中
            if index < n {
                waitCustomer += customers[index]
            }
            
            // 当前轮次需要乘坐的乘客（最多乘坐 4 人）
            let boardCustomer = min(4, waitCustomer)
            
            // 从等待乘客中减去乘坐的
            waitCustomer -= boardCustomer
            
            // 计算当前收益
            profit += (boardCustomer * boardingCost - runningCost)
            
            // 如果当前收益超过最大收益，更新最大收益及轮次
            if profit > maxProfit {
                maxProfit = profit
                minOperations = index + 1
            }
            
            // 排队移动至下一组乘客
            index += 1
        }
        return minOperations
    }
}