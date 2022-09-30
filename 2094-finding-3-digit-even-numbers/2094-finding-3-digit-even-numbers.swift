class Solution {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        // 剔除多余数据，最多重复三次
        var digitCount = [Int](repeating: 0, count: 10)
        var newDigits = [Int]()
        for digit in digits where digitCount[digit] < 3 {
            digitCount[digit] += 1
            newDigits.append(digit)
        }
        let n = newDigits.count
        var set = Set<Int>()
        for i in 0..<n {
            let digitI = newDigits[i]
            for j in 0..<n where j != i {
                let digitJ = newDigits[j]
                for k in 0..<n where k != i && k != j {
                    let digitK = newDigits[k]
                    let num = digitI * 100 + digitJ * 10 + digitK
                    if num >= 100 && num % 2 == 0 {
                        set.insert(num)
                    }
                }
            }
        }
        return set.sorted()
    }
}
