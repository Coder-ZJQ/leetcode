
class WordDictionary {
    
    private var children = [WordDictionary?](repeating: nil, count: 26)
    private var isEnd = false

    init() {
        
    }
    
    func addWord(_ word: String) {
        var node = self
        for char in word {
            let index = Int(char.asciiValue!) - 97
            if node.children[index] == nil {
                node.children[index] = WordDictionary()
            }
            node = node.children[index]!
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        
        var queue = [self]
        for char in word {
            guard !queue.isEmpty else { return false }
            let index = Int(char.asciiValue!) - 97
            var array = [WordDictionary]()
            for node in queue {
                if char == "." {
                    for child in node.children where child != nil {
                        array.append(child!)
                    }
                } else {
                    if let next = node.children[index] {
                        array.append(next)
                    }
                }
            }
            queue = array
        }
        for node in queue where node.isEnd {
            return true
        }
        return false
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
