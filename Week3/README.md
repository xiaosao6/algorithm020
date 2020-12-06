----

**难点：**  

- 如何理清层层递进的逻辑关系(即设计递归函数的参数，每层结果与最终结果的关系，层级i与下一层之间的逻辑关系)
- 如何定义递归的终止条件
- 如何组装最终的结果
- 分治法如何分解问题为重复的子问题
- 回溯法如何将每一层的逻辑分为“做某种选择”和“撤销该选择”


**主要收获：**

- 不要进行人脑递归思考，而只是用画图理清层层递进的逻辑规律
- 用最近最简单的方法，拆解问题为重复的子问题
- 多运用数学归纳法的思维，从简单的初始条件，结合重复性规律，推导出结果的正确性

---- 
### 递归

**要点：**  
常见于树的操作


**代码模板：**  

```swift
func recursion(level: Int, param1: Any ...) {
    
    // ① terminator 递归终止条件
    if level >= MAX_LEVEL {
        // 处理结果
        return
    }
    
    // ② process current 处理当前层逻辑
    process(level, param1)
    
    // ③ drill down 下探到下一层
    recursion(level: level + 1, param1: newParam)
    
    // ④ reverse states 如果需要恢复当前层的状态
}

```

**常考题型：**

[爬楼梯](https://leetcode-cn.com/problems/climbing-stairs/)  
[翻转二叉树](https://leetcode-cn.com/problems/invert-binary-tree/description/)  
[验证二叉搜索树](https://leetcode-cn.com/problems/validate-binary-search-tree)  
[二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree)  
[二叉树的最小深度](https://leetcode-cn.com/problems/minimum-depth-of-binary-tree)  
[二叉树的序列化与反序列化](https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/)  
[二叉树的最近公共祖先](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/)  
[从前序与中序遍历序列构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal)  
[组合](https://leetcode-cn.com/problems/combinations/)  
[全排列](https://leetcode-cn.com/problems/permutations/)  
[全排列II](https://leetcode-cn.com/problems/permutations-ii/)

----

### 分治


**代码模板：**  

```swift
func divide_conquer(problem: Problem?) -> Result {
    
    // ① terminator 递归终止条件
    if problem == nil {
        // 处理结果
        return result
    }
    
    // ② process current 分解问题为多个子问题
    let subProblems = split_problem(problem)
    
    // ③ drill down 下探解决子问题
    let res0 = divide_conquer(subProblems[0])
    let res1 = divide_conquer(subProblems[1])
    ...
    
    // ④ combination 组合子问题的解
    let result = process_result(res0, res1, ...)
    
    // ⑤ reverse states 如果需要恢复当前层的状态
    
    return result
}

```

**常考题型：**

[括号生成](https://leetcode-cn.com/problems/generate-parentheses/)  
[Pow(x, n) ](https://leetcode-cn.com/problems/powx-n/)  
[子集](https://leetcode-cn.com/problems/subsets/)  
[多数元素](https://leetcode-cn.com/problems/majority-element/description/)

----

### 回溯




**使用场景：**  

当问题需要“回头重试”，以此来查找出所有的解的时候。即满足结束条件或者发现不是正确路径的时候，要撤销选择，回退到上一个状态，继续尝试，直到找出所有解为止。

**三个要点：**  

- 选择
- 约束条件
- 目标

**代码模板：**

```swift
func backTrack(level: Int, param1: Any ...) {
    
    // ① terminator 递归终止条件
    if level >= MAX_LEVEL {
        // 处理结果
        return
    }
    
    // ② process current 处理当前层逻辑
    process(level, param1)
    
    // ③ drill down 下探到下一层
    backTrack(level: level + 1, param1: newParam)
    
    // ④ reverse states 如果需要恢复当前层的状态
}

```

**常见题目类型：**  

- 求所有子集、组合
- 全排列
- 搜索（数独，N皇后...）

**常考题型：**

[电话号码的字母组合](https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number/)  
[N 皇后](https://leetcode-cn.com/problems/n-queens/)



