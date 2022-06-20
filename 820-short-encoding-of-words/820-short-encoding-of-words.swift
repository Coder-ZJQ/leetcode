class TrieNode {
    var children: [Character: TrieNode] = [:]
    var depth = 0
    
    func sumDepth() -> Int {
        if children.isEmpty {
            return depth + 1
        }
        var sum = 0
        for child in children.values {
            sum += child.sumDepth()
        }
        return sum
    }
}

class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        let root = TrieNode()
        for word in words {
            var cur = root
            for char in word.reversed() {
                if let child = cur.children[char] {
                    cur = child
                } else {
                    let child = TrieNode()
                    child.depth = cur.depth + 1
                    cur.children[char] = child
                    cur = child
                }
            }
        }
        
        return root.sumDepth()
    }
}