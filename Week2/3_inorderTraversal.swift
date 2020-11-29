class Solution {

    // 使用栈+循环
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var result = [Int]()

        var stack = [TreeNode]()

        var node = root

        while node != nil || !stack.isEmpty {

            while let n = node {
                stack.append(n)
                node = n.left
            }

            node = stack.removeLast()
            result.append(node!.val)
            node = node?.right
        }

        return result
    }

    // 使用递归
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {

        var array = [Int]()

        _inorderTraversal(root, &array)

        return array
    }

    private func _inorderTraversal(_ root: TreeNode?, _ array: inout [Int]) {
        
        if root == nil { return }

        _inorderTraversal(root?.left, &array)

        array.append(root!.val)

        _inorderTraversal(root?.right, &array)
    }
}