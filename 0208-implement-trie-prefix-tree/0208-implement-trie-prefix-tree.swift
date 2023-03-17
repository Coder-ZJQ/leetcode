
class Trie {
    
    private var children = [Trie?](repeating: nil, count: 26)
    private var isEnd = false

    init() {
        
    }
    
    func insert(_ word: String) {
        var curNode = self
        for char in word {
            let index = Int(char.asciiValue!) - 97
            if curNode.children[index] == nil {
                curNode.children[index] = Trie()
            }
            curNode = curNode.children[index]!
        }
        curNode.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var curNode = self
        for char in word {
            let index = Int(char.asciiValue!) - 97
            if let node = curNode.children[index] {
                curNode = node
            } else {
                return false
            }
        }
        return curNode.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var curNode = self
        for char in prefix {
            let index = Int(char.asciiValue!) - 97
            if let node = curNode.children[index] {
                curNode = node
            } else {
                return false
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */