/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} original
 * @param {TreeNode} cloned
 * @param {TreeNode} target
 * @return {TreeNode}
 */

var getTargetCopy = function(original, cloned, target) {
    if (!cloned || cloned.val == target.val) {
        return cloned
    } else {
        // 递归左右子节点寻找
        return getTargetCopy(original, cloned.left, target) || getTargetCopy(original, cloned.right, target)
    }
};