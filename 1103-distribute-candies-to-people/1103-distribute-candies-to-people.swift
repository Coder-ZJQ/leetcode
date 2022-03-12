class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var res = [Int](repeating: 0, count: num_people)
        var n = 1,
            candies = candies
        while candies - n > 0 {
            let i = (n - 1) % num_people
            res[i] += n
            candies -= n
            n += 1
        }
        if candies > 0 {
            let i = (n - 1) % num_people
            res[i] += candies
        }
        return res
    }
}
