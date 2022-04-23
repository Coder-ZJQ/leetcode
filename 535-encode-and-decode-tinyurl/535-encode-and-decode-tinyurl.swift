class Codec {
    /// 短链接对长链接映射
    private var s2lMapper = [String: String]()
    /// 长链接对短链接映射
    private var l2sMapper = [String: String]()
    
    /// 生成指定长度的随机 url path
    private func generateShortPath(length: Int) -> String {
        // 在这些字符中随机取
        let randoms = [Character]("1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        // path 斜杠
        var chars: [Character] = ["/"]
        for _ in 0..<length {
            chars.append(randoms.randomElement()!)
        }
        return String(chars)
    }
    
    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        
        if let cmps = URLComponents(string: longUrl) {
            var cmps = cmps
            
            cmps.path = generateShortPath(length: 4)
            var shortUrl = cmps.string!
            // 如果已经存在映射，则重新生成短链接
            while let _ = s2lMapper[shortUrl] {
                cmps.path = generateShortPath(length: 4)
                shortUrl = cmps.string!
            }
            // 建立短链接对长链接的映射，用以判断生成的短链接是否已与另一个长链接映射
            s2lMapper[shortUrl] = longUrl
            
            // 建立长链接对短链接的映射，用以获取“解码”结果
            l2sMapper[longUrl] = shortUrl
            return shortUrl
        }
        return longUrl
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        s2lMapper[shortUrl] ?? shortUrl
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
*/