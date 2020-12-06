
class Solution {

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        if root == nil || root?.val == p?.val || root?.val == q?.val { return root }

        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)

        if left == nil { return right }
        if right == nil { return left }

        return root
    }
}