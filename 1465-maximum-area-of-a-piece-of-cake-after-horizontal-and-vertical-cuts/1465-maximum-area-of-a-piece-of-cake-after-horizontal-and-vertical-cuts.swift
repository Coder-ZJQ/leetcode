class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        let hCuts = [0] + horizontalCuts.sorted() + [h]
        let vCuts = [0] + verticalCuts.sorted() + [w]
        var hGap = 0, vGap = 0
        for i in 1..<hCuts.count {
            hGap = max(hGap, hCuts[i] - hCuts[i - 1])
        }
        for i in 1..<vCuts.count {
            vGap = max(vGap, vCuts[i] - vCuts[i - 1])
        }
        return hGap * vGap % 1_000_000_007
    }
}
