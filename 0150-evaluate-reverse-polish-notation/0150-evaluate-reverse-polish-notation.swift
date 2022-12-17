class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for token in tokens {
            switch token {
            case "+":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 + num2)
            case "-":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 - num2)
            case "*":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 * num2)
            case "/":
                let num2 = stack.removeLast()
                let num1 = stack.removeLast()
                stack.append(num1 / num2)
            default:
                stack.append(Int(token) ?? 0)
            }
        }
        return stack.last ?? 0
    }
}
