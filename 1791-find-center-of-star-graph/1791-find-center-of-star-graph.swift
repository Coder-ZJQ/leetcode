class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        // 判断前两个数组中相等的就是结果
        edges[0][0] == edges[1][0] || edges[0][0] == edges[1][1] ? edges[0][0] : edges[0][1]
    }
}