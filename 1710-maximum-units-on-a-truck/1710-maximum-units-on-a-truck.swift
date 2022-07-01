class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        // 计算盒子总数
        let count = boxTypes.reduce(0) { result, boxs in
            result + boxs[0]
        }
        // 如果卡车容积超过盒子总数
        if count <= truckSize {
            // 直接返回所有单位
            return boxTypes.reduce(0) { result, boxes in
                result + (boxes[0] * boxes[1])
            }
        }
        // 根据盒子可装单位数排序
        let sorted = boxTypes.sorted { pre, nxt in
            if pre[1] == nxt[1] {
                return pre[0] >= nxt[0]
            }
            return pre[1] > nxt[1]
        }
        var result = 0, size = truckSize
        // 遍历超过卡车承载量后退出
        for box in sorted {
            if size >= box[0] {
                result += box[0] * box[1]
                size -= box[0]
            } else {
                result += size * box[1]
                break
            }
        }
        return result
    }
}