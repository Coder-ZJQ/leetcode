class Solution {
    func checkOverlap(_ radius: Int, _ xCenter: Int, _ yCenter: Int, _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Bool {
        let top = y2 + radius,
            bottom = y1 - radius,
            right = x2 + radius,
            left = x1 - radius
        // 确保在大矩形内，否则不存在覆盖
        guard (xCenter >= left && xCenter <= right) && (yCenter >= bottom && yCenter <= top) else {
            return false
        }
        
        // 如果在大矩形内，则判断在四个圆角时到四个角的距离
        // 在左边
        if xCenter < x1 {
            // 左下角
            if yCenter < y1 {
                let hor = x1 - xCenter, ver = y1 - yCenter
                return hor * hor + ver * ver <= radius * radius
            }
            // 左上角
            if yCenter > y2 {
                let hor = x1 - xCenter, ver = y2 - yCenter
                return hor * hor + ver * ver <= radius * radius
            }
        }
        // 在右边
        if xCenter > x2 {
            // 右下角
            if yCenter < y1 {
                let hor = x2 - xCenter, ver = y1 - yCenter
                return hor * hor + ver * ver <= radius * radius
            }
            // 右上角
            if yCenter > y2 {
                let hor = x2 - xCenter, ver = y2 - yCenter
                return hor * hor + ver * ver <= radius * radius
            }
        }
        return true
    }
}