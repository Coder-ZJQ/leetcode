class TimeMap {
    
    typealias TimestampValue = (timestamp: Int, value: String)
    var map: [String: [TimestampValue]]

    init() {
        map = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if let _ = map[key] {
            // timestamp 严格递增所以直接追加
            map[key]!.append((timestamp, value))
        } else {
            map[key] = [(timestamp, value)]
        }
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if let pairs = map[key] {
            var l = 0, r = pairs.count - 1
            while l <= r {
                let m = l + (r - l) >> 1
                let pairMid = pairs[m]
                let timestampMid = pairMid.timestamp
                if timestampMid > timestamp {
                    r = m - 1
                } else if timestampMid < timestamp {
                    l = m + 1
                } else {
                    return pairMid.value
                }
            }
            if r >= 0 {
                return pairs[r].value;
            }
        }
        return ""
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */