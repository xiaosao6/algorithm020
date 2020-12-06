
class Solution {

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        if inorder.isEmpty { return nil }
        
        let root = TreeNode(preorder[0])
        
        guard let index = inorder.firstIndex(of: preorder[0]) else { return root }
        
        if index == 0 {
            root.left = nil
        } else {
            root.left = buildTree(Array<Int>(preorder[1...index]), Array<Int>(inorder[..<index]))
        }
        
        root.right = buildTree(Array<Int>(preorder[(index+1)...]), Array<Int>(inorder[(index+1)...]))
        
        return root
    }
}