// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    
    private var iterator: IndexingIterator<Array<Int>>
    private var nextElement: Int?
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        iterator = arr
        nextElement = iterator.next()
    }
    
    func next() -> Int {
        let res = nextElement!
        if let next = iterator.next() {
            nextElement = next
        } else {
            nextElement = nil
        }
        return res
    }
    
    func peek() -> Int {
        nextElement!
    }
    
    func hasNext() -> Bool {
        nextElement != nil
    }
}

/**
 * Your PeekingIterator object will be instantiated and called as such:
 * let obj = PeekingIterator(arr)
 * let ret_1: Int = obj.next()
 * let ret_2: Int = obj.peek()
 * let ret_3: Bool = obj.hasNext()
 */