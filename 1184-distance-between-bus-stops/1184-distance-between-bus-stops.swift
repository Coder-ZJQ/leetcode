class Solution {
    func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
        let small = min(start, destination),
            big = max(start, destination)
        var clockwise = 0, counterclockwise = 0
        for i in small..<big {
            clockwise += distance[i]
        }
        if small > 0 {
            for i in 0..<small {
                counterclockwise += distance[i]
            }
        }
        for i in big..<distance.count {
            counterclockwise += distance[i]
        }
        return min(clockwise, counterclockwise)
    }
}
