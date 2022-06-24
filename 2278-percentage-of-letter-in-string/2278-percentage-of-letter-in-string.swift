class Solution {
    func percentageLetter(_ s: String, _ letter: Character) -> Int {
        s.reduce(0) { partialResult, char in
            char == letter ? partialResult + 1 : partialResult
        } * 100 / s.count
    }
}
