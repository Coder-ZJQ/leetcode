class Codec {
    
    /*
    1. 随机生成短链接
    2. 短链接是否已建立映射
        2.1 已建立：重新生成短链接
        2.2 未建立：建立映射
    3. 通过映射获取长链接
    
    */
    
    /// 已生成的短链接集合
    private var shortUrlSet = Set<String>()
    /// 短链接对长链接映射
    private var mapper = [String: String]()
    
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
            var path = generateShortPath(length: 4)
            while shortUrlSet.contains(path) {
                path = generateShortPath(length: 4)
            }
            shortUrlSet.insert(path)
            cmps.path = path
            let shortUrl = cmps.string!
            mapper[shortUrl] = longUrl
            return shortUrl
        }
        return longUrl
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        mapper[shortUrl] ?? shortUrl
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
*/