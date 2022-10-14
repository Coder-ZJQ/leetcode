class Solution {
    private func countOfMPG(in garbage: String) -> (M: Int, P: Int, G: Int) {
        var mpg = (M: 0, P: 0, G: 0)
        for char in garbage {
            if char == "M" {
                mpg.M += 1
            } else if char == "P" {
                mpg.P += 1
            } else if char == "G" {
                mpg.G += 1
            }
        }
        return mpg
    }
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var travel = [0] + travel
        for i in 1..<travel.count {
            travel[i] += travel[i - 1]
        }
        let mpgs = garbage.map {
            countOfMPG(in: $0)
        }
        var travelM = -1,
            travelP = -1,
            travelG = -1
        var countOfM = 0,
            countOfP = 0,
            countOfG = 0
        for (i, mpg) in mpgs.enumerated().reversed() {
            countOfM += mpg.M
            countOfP += mpg.P
            countOfG += mpg.G
            if mpg.M > 0 && travelM == -1 {
                travelM = i
            }
            if mpg.P > 0 && travelP == -1 {
                travelP = i
            }
            if mpg.G > 0 && travelG == -1 {
                travelG = i
            }
        }
        var res = 0
        if travelM != -1 && countOfM > 0 {
            res += travel[travelM] + countOfM
        }
        if travelP != -1 && countOfP > 0 {
            res += travel[travelP] + countOfP
        }
        if travelG != -1 && countOfG > 0 {
            res += travel[travelG] + countOfG
        }
        
        return res
    }
}
