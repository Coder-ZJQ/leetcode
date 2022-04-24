
class UndergroundSystem {
    
    private var checkInMapper: [Int: (station: String, time: Int)]
    private var timeCounter: [String: (time: Int, people: Int)]

    init() {
        checkInMapper = [:]
        timeCounter = [:]
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        checkInMapper[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        let (checkInStation, checkInTime) = checkInMapper[id]!
        let key = "\(checkInStation)-\(stationName)"
        let takeTime = t - checkInTime
        if let (recordedTime, recordedPeople) = timeCounter[key] {
            timeCounter[key] = (recordedTime + takeTime, recordedPeople + 1)
        } else {
            timeCounter[key] = (takeTime, 1)
        }
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let key = "\(startStation)-\(endStation)"
        let (time, people) = timeCounter[key]!
        return Double(time) / Double(people)
    }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */