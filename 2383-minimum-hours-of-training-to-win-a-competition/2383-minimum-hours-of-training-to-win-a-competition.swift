class Solution {
    func minNumberOfHours(_ initialEnergy: Int, _ initialExperience: Int, _ energy: [Int], _ experience: [Int]) -> Int {
        var currentEnergy = initialEnergy, currentExperience = initialExperience, res = 0
        for (opponentEnergy, opponentExperience) in zip(energy, experience) {
            if currentExperience <= opponentExperience {
                let diff = opponentExperience - currentExperience + 1
                res += diff
                currentExperience += diff
            }
            if currentEnergy <= opponentEnergy {
                let diff = opponentEnergy - currentEnergy + 1
                res += diff
                currentEnergy += diff
            }
            currentEnergy -= opponentEnergy
            currentExperience += opponentExperience
        }
        return res
    }
}