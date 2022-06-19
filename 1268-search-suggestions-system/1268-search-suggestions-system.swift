class TrieNode {
    var children: [Character: TrieNode] = [:]
    var words: [String] = []
    
    class func trieTreeWithWords(_ words: [String]) -> TrieNode {
        let node = TrieNode()
        for word in words {
            var cur = node
            for char in word {
                if let child = cur.children[char] {
                    child.words.append(word)
                    child.words.sort()
                    cur = child
                } else {
                    let child = TrieNode()
                    child.words.append(word)
                    cur.children[char] = child
                    cur = child
                }
            }
        }
        return node
    }
}

class Solution {
    
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        
        var cur = TrieNode.trieTreeWithWords(products)
        var res = [[String]](repeating: [], count: searchWord.count)
        for (i, char) in searchWord.enumerated() {
            if let child = cur.children[char] {
                if child.words.count > 3 {
                    res[i] = Array(child.words[..<3])
                } else {
                    res[i] = child.words
                }
                cur = child
            } else {
                break
            }
        }
        return res
    }
}