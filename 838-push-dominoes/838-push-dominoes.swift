class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var dominoeChars = [Character]("L" + dominoes + "R")
        let n = dominoeChars.count
        var l2r = [Int](repeating: 0, count: n),
            r2l = [Int](repeating: 0, count: n)
        var pre = 0
        for i in 1..<(n-1) {
            let char = dominoeChars[i]
            if char == "." {
                l2r[i] = pre
            } else if char == "L" {
                pre = -1 * i
            } else if char == "R" {
                pre = i
            }
        }
        pre = n - 1
        for i in (1..<n-1).reversed() {
            let char = dominoeChars[i]
            if char == "." {
                r2l[i] = pre
            } else if char == "L" {
                pre = -1 * i
            } else if char == "R" {
                pre = i
            }
        }
        var res = [Character]()
        for i in 1..<(n-1) {
            let char = dominoeChars[i]
            if char == "." {
                let l = l2r[i],
                    r = r2l[i]
                if l > 0 {
                    if r > 0 {  // R...R
                        res.append("R")
                    } else {    // R...L
                        let l2i = i - l,
                            r2i = -1 * r - i
                        if l2i > r2i {
                            res.append("L")
                        } else if l2i < r2i {
                            res.append("R")
                        } else {
                            res.append(".")
                        }
                    }
                } else {
                    if r > 0 {  // L...R
                        res.append(".")
                    } else {    // L...L
                        res.append("L")
                    }
                }
            } else {
                res.append(char)
            }
        }
        return String(res)
    }
}
