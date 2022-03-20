class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        var countTops = [Int](repeating: 0, count: 7),
            countBottoms = [Int](repeating: 0, count: 7),
            countSames = [Int](repeating: 0, count: 7)
        let n = tops.count
        
        for i in 0..<n {
            let top = tops[i],
                bottom = bottoms[i]
            countTops[top] += 1
            countBottoms[bottom] += 1
            if top == bottom {
                countSames[top] += 1
            }
        }
        for i in 1...6 {
            let top = countTops[i],
            bottom = countBottoms[i],
            same = countSames[i]
            if top + bottom - same == n {
                return n - max(top, bottom)
            }
        }
        return -1
    }
}
