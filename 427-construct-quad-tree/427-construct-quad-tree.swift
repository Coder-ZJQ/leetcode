/**
 * Definition for a QuadTree node.
 * public class Node {
 *     public var val: Bool
 *     public var isLeaf: Bool
 *     public var topLeft: Node?
 *     public var topRight: Node?
 *     public var bottomLeft: Node?
 *     public var bottomRight: Node?
 *     public init(_ val: Bool, _ isLeaf: Bool) {
 *         self.val = val
 *         self.isLeaf = isLeaf
 *         self.topLeft = nil
 *         self.topRight = nil
 *         self.bottomLeft = nil
 *         self.bottomRight = nil
 *     }
 * }
 */

class Solution {
    func construct(_ grid: [[Int]]) -> Node? {
        let n = grid.count
        guard n != 0 else { return nil }
        guard n > 1 else { return Node(grid.first!.first! == 1, true) }
        var nodeGrid = [[Node]]()
        for i in 0..<n / 2 {
            var nodeArray = [Node]()
            for j in 0..<n / 2 {
                let topLeft = grid[i * 2][j * 2],
                    topRight = grid[i * 2][j * 2 + 1],
                    bottomLeft = grid[i * 2 + 1][j * 2],
                    bottomRight = grid[i * 2 + 1][j * 2 + 1]
                
                if topLeft == topRight &&
                    topRight == bottomRight &&
                    bottomRight == bottomLeft {
                    let node = Node(topLeft == 1, true)
                    nodeArray.append(node)
                } else {
                    let node = Node(true, false)
                    node.topLeft = Node(topLeft == 1, true)
                    node.topRight = Node(topRight == 1, true)
                    node.bottomLeft = Node(bottomLeft == 1, true)
                    node.bottomRight = Node(bottomRight == 1, true)
                    nodeArray.append(node)
                }
            }
            nodeGrid.append(nodeArray)
        }
        
        while nodeGrid.count / 2 > 0 {
            let n = nodeGrid.count
            var newNodeGrid = [[Node]]()
            for i in 0..<n / 2 {
                var nodeArray = [Node]()
                for j in 0..<n / 2 {
                    let topLeft = nodeGrid[i * 2][j * 2],
                        topRight = nodeGrid[i * 2][j * 2 + 1],
                        bottomLeft = nodeGrid[i * 2 + 1][j * 2],
                        bottomRight = nodeGrid[i * 2 + 1][j * 2 + 1]
                    
                    if topLeft.val == topRight.val && topRight.val == bottomRight.val && bottomRight.val == bottomLeft.val &&
                        topLeft.isLeaf && topRight.isLeaf && bottomLeft.isLeaf && bottomRight.isLeaf {
                        let node = Node(topLeft.val, true)
                        nodeArray.append(node)
                    } else {
                        let node = Node(true, false)
                        node.topLeft = topLeft
                        node.topRight = topRight
                        node.bottomLeft = bottomLeft
                        node.bottomRight = bottomRight
                        nodeArray.append(node)
                    }
                }
                newNodeGrid.append(nodeArray)
            }
            nodeGrid = newNodeGrid
            
        }
        
        return nodeGrid.first?.first
    }
}