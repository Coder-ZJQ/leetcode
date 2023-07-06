class Solution {
    func maximumEvenSplit(_ finalSum: Int) -> [Int] {
        var res = [Int](), sum = 0
        guard finalSum % 2 == 0 else {
            return res
        }
        for i in 1... {
            if sum + 2 * i > finalSum {
                res[res.count - 1] += finalSum - sum
                break
            } else {
                sum += 2 * i
                res.append(2 * i)
            }
        }
        return res
    }
}