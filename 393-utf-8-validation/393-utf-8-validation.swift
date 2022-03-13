class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        var n = 0
        for byte in data {
            if n > 0 {
                // 后续字节需以 “10” 开头，否则则为非法
                guard byte >> 6 == 0b10 else { return false }
                n -= 1
            } else if n == 0 {
                if byte >> 7 == 0b0 {               // 共 1 字节，无后续字节
                    n = 0
                } else if byte >> 5 == 0b110 {      // 共 2 字节，除当前还剩 1 字节
                    n = 1
                } else if byte >> 4 == 0b1110 {     // 共 3 字节，除当前还剩 2 字节
                    n = 2
                } else if byte >> 3 == 0b11110 {    // 共 4 字节，除当前还剩 3 字节
                    n = 3
                } else {                            // 其余情况则不合法
                    return false
                }
            } else {
                return false
            }
        }
        return n == 0
    }
}