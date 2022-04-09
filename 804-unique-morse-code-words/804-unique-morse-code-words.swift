class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var set = Set<String>()
        for word in words {
            let str = word.unicodeScalars.reduce("") { partialResult, scalar in
                partialResult + morse[Int(scalar.value) - 97]
            }
            set.insert(str)
        }
        return set.count
    }
}
