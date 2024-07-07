class Solution {
    func checkMove(_ board: [[Character]], _ rMove: Int, _ cMove: Int, _ color: Character) -> Bool {
        // 八个方向
        let directions = [(1, 1), (-1, -1), (-1, 1), (1, -1), (0, 1), (0, -1), (1, 0), (-1, 0)]
        for direction in directions {
            // 行及列偏移量
            let rDelta = direction.0, cDelta = direction.1
            // 当前行列
            var rCur = rMove + rDelta, cCur = cMove + cDelta
            var step = 1
            // 边界判断
            while rCur >= 0 && rCur < 8 && cCur >= 0 && cCur < 8 {
                // 当前格子颜色
                let colorCur = board[rCur][cCur]
                // 第一个格子需为相反的颜色
                if step == 1 {
                    if colorCur == "." || colorCur == color {
                        break
                    }
                } else {
                    if colorCur == "." {
                        break
                    }
                    if colorCur == color {
                        return true
                    }
                }
                
                step += 1
                rCur += rDelta
                cCur += cDelta
            }
        }
        return false
    }
}
