
class FreqStack {
    private var freqDict: [Int: Int]        // [值: 出现次数]
    private var freqStackDict: [Int: [Int]] // [出现次数: 值数组]
    private var maxFreq = 0                 // 当前最大出现次数

    init() {
        freqDict = [Int: Int]()
        freqStackDict = [Int: [Int]]()
    }
    
    func push(_ val: Int) {
        let freq = freqDict[val, default: 0] + 1
        freqDict[val] = freq
        maxFreq = max(maxFreq, freq)
        if let _ = freqStackDict[freq] {
            freqStackDict[freq]!.append(val)
        } else {
            freqStackDict[freq] = [val]
        }
    }
    
    func pop() -> Int {
        let last = freqStackDict[maxFreq]!.removeLast()
        freqDict[last]! -= 1
        if freqStackDict[maxFreq]!.isEmpty {
            maxFreq -= 1
        }
        return last
    }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * let obj = FreqStack()
 * obj.push(val)
 * let ret_2: Int = obj.pop()
 */