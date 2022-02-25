class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let sub1 = version1.split(separator: "."),
            sub2 = version2.split(separator: ".")
        for (r1, r2) in zip(sub1, sub2) {
            let intR1 = Int(r1) ?? 0
            let intR2 = Int(r2) ?? 0
            if intR1 < intR2 {
                return -1
            } else if intR1 > intR2 {
                return 1
            }
        }
        if sub1.count > sub2.count {
            for revision in sub1[sub2.count...] {
                let intR = Int(revision) ?? 0
                if intR > 0 {
                    return 1
                }
            }
        } else if sub1.count < sub2.count {
            for revision in sub2[sub1.count...] {
                let intR = Int(revision) ?? 0
                if intR > 0 {
                    return -1
                }
            }
        }
        return 0
    }
}