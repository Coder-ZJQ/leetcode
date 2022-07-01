/// 运算操作符
enum Operator {
    /// 加法
    case addition
    /// 减法
    case subtraction
    /// 乘法
    case multiplication
    /// 数字
    case number(Int)
}

class Solution {
    private var operators = [Operator]()
    
    private func dfs(_ dp: inout [[[Int]]], _ l: Int, _ r: Int) -> [Int] {
        if dp[l][r].isEmpty {
            if l == r {
                if case let .number(num) = operators[l] {
                    dp[l][r].append(num)
                }
            } else {
                for i in stride(from: l, to: r, by: +2) {
                    let leftValues = dfs(&dp, l, i)
                    let rightValues = dfs(&dp, i + 2, r)
                    let opt = operators[i + 1]
                    for lv in leftValues {
                        for rv in rightValues {
                            switch opt {
                            case .addition:
                                dp[l][r].append(lv + rv)
                            case .subtraction:
                                dp[l][r].append(lv - rv)
                            case .multiplication:
                                dp[l][r].append(lv * rv)
                            default:
                                break
                            }
                        }
                    }
                }
            }
        }
        return dp[l][r]
    }
    
    func diffWaysToCompute(_ expression: String) -> [Int] {
        var number: String = ""
        for char in expression {
            switch char {
            case "+", "-", "*":
                if !number.isEmpty {
                    operators.append(.number(Int(number) ?? 0))
                    number = ""
                }
                if char == "+" {
                    operators.append(.addition)
                } else {
                    operators.append(char == "-" ? .subtraction : .multiplication)
                }
            default:
                number.append(char)
            }
        }
        if !number.isEmpty {
            operators.append(.number(Int(number) ?? 0))
        }
        let n = operators.count
        let repeating = [[Int]](repeating: [], count: n)
        var dp = [[[Int]]](repeating: repeating, count: n)
        return dfs(&dp, 0, n - 1)
    }
}
