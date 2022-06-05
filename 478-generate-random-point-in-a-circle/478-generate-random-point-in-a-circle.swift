class Solution {
    
    private var radius: Double
    private var x_center: Double
    private var y_center: Double

    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        self.x_center = x_center
        self.y_center = y_center
    }
    
    func randPoint() -> [Double] {
        let x_random = Double.random(in: -radius...radius)
        let y_random = Double.random(in: -radius...radius)
        if x_random * x_random + y_random * y_random <= radius * radius {
            return [x_center + x_random, y_center + y_random]
        } else {
            return randPoint()
        }
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(radius, x_center, y_center)
 * let ret_1: [Double] = obj.randPoint()
 */