/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    
    private func numsToNestedInteger(_ nums: [Character]) -> NestedInteger {
        let nested = NestedInteger()
        if nums.count > 0 {
            let value = Int(String(nums)) ?? 0
            nested.setInteger(value)
        }
        return nested
    }
    
    func deserialize(_ s: String) -> NestedInteger {
        var nums: [Character] = [],
            stack: [NestedInteger] = [],
            res: NestedInteger?
        for c in s {
            if c == "[" {
                let nested = NestedInteger()
                if let last = stack.last {
                    last.add(nested)
                }
                stack.append(nested)
            } else if c == "," || c == "]" {
                if nums.count > 0 {
                    let nested = numsToNestedInteger(nums)
                    stack.last!.add(nested)
                    nums = []
                }
                if c == "]" {
                    res = stack.removeLast()    
                }
                
            } else {
                nums.append(c)
            }
        }
        return res ?? numsToNestedInteger(nums)
    }
}