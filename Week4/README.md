
----
### 深度优先DFS

深度优先的思想与“回溯”法有相似之处。

- 模板：

```Swift
func dfs_traversal(root: TreeNode?) {
    
    // 判断 base case
    if (root == nil) {
        return;
    }
    
    // 处理当前node...
    
    // 访问两个相邻结点：左子结点、右子结点
    dfs_traversal(root!.left)
    dfs_traversal(root!.right)
}
```

- 常见题型：  
[最小基因变化](https://leetcode-cn.com/problems/minimum-genetic-mutation/#/description)  
[括号生成](https://leetcode-cn.com/problems/generate-parentheses/#/description)  
[岛屿数量](https://leetcode-cn.com/problems/number-of-islands/)

### 广度优先BFS

- 模板：

```Swift
// 借助队列实现BFS

func levelOrder(_ root: TreeNode?) -> [[Int]] {

    if root == nil { return [] }

    var result = [[Int]]()
    var queue = [TreeNode]()
    queue.append(root!)
    
    while !queue.isEmpty {

        var levelValues = [Int]()
        let n = queue.count // 这一层所有节点的数量
        
        for i in 0..<n {

            let node = queue.removeFirst()
            levelValues.append(node.val)
            
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        result.append(levelValues)
    }

    return result
}


```

- 常见题型：  
[二叉树的层序遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal/#/description)  
[在每个树行中找最大值](https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row/#/description)  
[单词接龙](https://leetcode-cn.com/problems/word-ladder/description/)  
[扫雷游戏](https://leetcode-cn.com/problems/minesweeper/description/)


----
### 贪心



- 场景：  
问题能够分解成子问题解决，子问题的最优解能推导到最终问题的最优解，才可以使用贪心法； **贪心与动态规划的区别**：贪心法对每个子问题的解决方案的选择不能回退，而动态规划则会记录历史的运算结果，根据历史来决定当前选择，可以回退。


- 常见题型：  
[零钱兑换](https://leetcode-cn.com/problems/coin-change/)  
[柠檬水找零](https://leetcode-cn.com/problems/lemonade-change/description/)  
[买卖股票的最佳时机 II ](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/description/)  
[分发饼干](https://leetcode-cn.com/problems/assign-cookies/description/)  
[模拟行走机器人](https://leetcode-cn.com/problems/walking-robot-simulation/description/)  
[跳跃游戏](https://leetcode-cn.com/problems/jump-game/)  
[跳跃游戏 II ](https://leetcode-cn.com/problems/jump-game-ii/)

----
### 二分查找

- 场景： 目标函数单调性(递增or递减) + 存在上下界 + 能够使用index线性访问

- 模板：

```Swift

func binarySearch(values:[Int], target: Int) -> Int? {
    
    // 前提：数组是已经排序好的，从小到大
    
    var left = 0 // 左边界
    var right = values.count - 1 // 右边界
    
    while left <= right {
        
        let mid = left + ((right - left) / 2) // 中间元素
        
        if values[mid] == target { // 找到目标
            return mid
        } else if values[mid] < target { // 目标在mid右侧,更新左界继续
            left = mid + 1
        } else {                         // 目标在mid左侧,更新右界继续
            right = mid - 1
        }
    }
    
    return nil
}

```

- 常见题型：  
[x 的平方根](https://leetcode-cn.com/problems/sqrtx/)(另一种方法：牛顿迭代法注意理解)  
[有效的完全平方数](https://leetcode-cn.com/problems/valid-perfect-square/)  
[搜索旋转排序数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array/)  
[寻找旋转排序数组中的最小值](https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/)  
[搜索二维矩阵](https://leetcode-cn.com/problems/search-a-2d-matrix/)