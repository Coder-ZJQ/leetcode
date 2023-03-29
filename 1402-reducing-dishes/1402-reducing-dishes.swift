class Solution {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        var natural = [Int](), sumNatural = 0
        var negative = [Int](), sumNegative = 0
        for num in satisfaction {
            if num < 0 {
                negative.append(num)
                sumNegative += num
            } else {
                natural.append(num)
                sumNatural += num
            }
        }
        natural = natural.sorted()
        negative = negative.sorted()
        
        while let first = negative.first, sumNegative + sumNatural < 0 {
            negative.removeFirst()
            sumNatural -= first
        }
        
        return (negative + natural).enumerated().reduce(0) {
            $0 + ($1.0 + 1) * $1.1
        }
    }
}