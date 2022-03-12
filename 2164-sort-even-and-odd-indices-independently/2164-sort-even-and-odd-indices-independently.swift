class Solution {
    func sortEvenOdd(_ nums: [Int]) -> [Int] {
        var odd = [Int](),
            even = [Int]()
        for (index, num) in nums.enumerated() {
            if index % 2 == 0 {
                even.append(num)
            } else {
                odd.append(num)
            }
        }
        print(odd)
        print(even)
        odd = odd.sorted(by: >)
        even = even.sorted()
        
        let n = min(odd.count, even.count)
        var res = [Int]()
        for i in 0..<n {
            res.append(even[i])
            res.append(odd[i])
        }
        if odd.count != even.count, let last = even.last {
            res.append(last)
        }
        return res
    }
}