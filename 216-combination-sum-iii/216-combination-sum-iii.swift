class Solution {

    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ from: Int, _ k: Int, _ n: Int) {
        // 数量以及和需大于等于 0
        guard k >= 0, n >= 0 else { return }

        // 数量以及和都为 0 时添加到结果
        if k == 0 && n == 0 {
            res.append(path)
        } else {
            guard from <= 9 else { return }
            for i in from...9 {
                // 添加当前
                path.append(i)
                // 递归深度优先搜索
                dfs(&res, &path, i + 1, k - 1, n - i)
                // 回溯移除
                path.removeLast()
            }
        }
    }
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]](), path = [Int]()
        dfs(&res, &path, 1, k, n)
        return res
    }
}