class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        let sorted = envelopes.sorted { cur, nxt in
            // 如果宽度不相等时，按宽度顺序排序
            if cur[0] != nxt[0] {
                return cur[0] < nxt[0]
            }
            // 如果宽度相等时，按高度逆序排序，最高的排在前面
            return cur[1] > nxt[1]
        }
        
        // 转换成求高度的最长递增子序列
        // https://leetcode.com/problems/longest-increasing-subsequence/

        var tails = [sorted[0][1]]
        for envelope in sorted[1...] {
            let last = tails.last!, cur = envelope[1]
            // 如果当前高度比尾部大直接追加到尾部
            if cur > last {
                tails.append(cur)
            } else {
                var left = 0, right = tails.count - 1
                while left < right {
                    let mid = left + (right - left) >> 1
                    if tails[mid] < cur {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                tails[left] = cur
            }

        }
        return tails.count
    }
}