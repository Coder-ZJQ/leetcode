class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var res = [Int](repeating: 0, count: temperatures.count),
            stack = [Int]()
        for (i, temperature) in temperatures.enumerated() {
            while !stack.isEmpty && temperature > temperatures[stack.last!] {
                let pre = stack.removeLast()
                res[pre] = i - pre
            }
            stack.append(i)
        }
        return res
    }
}
