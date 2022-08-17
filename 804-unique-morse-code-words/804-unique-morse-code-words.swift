class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        let codes = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var mapper = [Character: String]()
        for (letter, code) in zip(letters, codes) {
            mapper[letter] = code
        }
        var set = Set<String>()
        for word in words {
            let morseCode = word.reduce("") { partialResult, next in
                partialResult + mapper[next]!
            }
            set.insert(morseCode)
        }
        return set.count
    }
}
