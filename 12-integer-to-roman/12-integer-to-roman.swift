class Solution {
    
    private func roman(_ num: Int, _ fst: Character, _ sec: Character, _ thr: Character) -> String {
        guard num > 0 && num < 10 else { return "" }
        if num < 4 {
            return String(repeating: thr, count: num)
        } else if num == 4 {
            return "\(thr)\(sec)"
        } else if num == 5 {
            return "\(sec)"
        } else if num < 9 {
            return "\(sec)" + String(repeating: thr, count: num - 5)
        } else {
            return "\(thr)\(fst)"
        }
    }
    
    func intToRoman(_ num: Int) -> String {
        var res = ""
        var num = num

        let thound = num / 1000
        res += roman(thound, " ", " ", "M")
        num %= 1000
        
        let hundred = num / 100
        res += roman(hundred, "M", "D", "C")
        num %= 100
        
        let ten = num / 10
        res += roman(ten, "C", "L", "X")
        num %= 10
        
        res += roman(num, "X", "V", "I")
        return res
    }
}