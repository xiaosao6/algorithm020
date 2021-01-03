----
###字典树  

- 基本结构：  
多叉树型结构，每条边代表一个选择，每个节点代表所有经过的选择所组成的单词  

- 核心思想  
	空间换时间，利用公共前缀降低查询的时间开销
	
- 基本性质  
  1.节点本身不存储完整单词  
  2.根节点到某一节点，路径经过的字符连接起来就组成对应的字符串  
  3.每个节点的每个子节点都代表不同字符
  
- 常见题型：  
[实现 Trie](https://leetcode-cn.com/problems/implement-trie-prefix-tree/solution/)  
[单词搜索 II ](https://leetcode-cn.com/problems/word-search-ii/)

----
###并查集  

- 使用场景：组团、配对问题， 是否属于同一个组

- 常见题型：   
[岛屿数量](https://leetcode-cn.com/problems/number-of-islands/)  
[被围绕的区域](https://leetcode-cn.com/problems/surrounded-regions/)

----
###高级搜索--剪枝 

BFS和DFS中使用的一种优化方案，提前判断不符合条件或次优的分支，减少遍历次数以优化时间  

- 常见题型：  
[括号生成](https://leetcode-cn.com/problems/generate-parentheses/)  
[有效的数独](https://leetcode-cn.com/problems/valid-sudoku/description/)  
[解数独](https://leetcode-cn.com/problems/sudoku-solver/#/description)  
[N 皇后](https://leetcode-cn.com/problems/n-queens/)

----
###高级搜索--双向BFS 

在BFS中，一般用来求解最短路径类的场景问题，由原先的从起始端单向BFS优化为：每次循环同时操作两端，从两端扩散，如果中间遇到解时即可结束，比普通单向BFS通常要快1倍左右

- 代码模板  

``` swift
class Solution {
    
    // 双向BFS模板
    
    private let possibleChars = "ABCD" // 所有可能的取值
    
    func twoEndedBFS(_ start: String, _ end: String, _ strs: [String]) -> Int {
        
        let dictionary = Set(strs)
        
        if !dictionary.contains(end) { return -1 }
        
        var result = 0
        
        var visitedA = Set<String>(arrayLiteral: start)
        var visitedB = Set<String>(arrayLiteral: end)
        var queueA = [String](arrayLiteral: start)
        var queueB = [String](arrayLiteral: end)
        
        while !queueA.isEmpty, !queueB.isEmpty {
            
            if queueA.count > queueB.count { // 保证queueA是更短的
                swap(&queueA, &queueB)
                swap(&visitedA, &visitedB)
            }
            
            result += 1
            
            for _ in 0..<queueA.count {
                
                let current = queueA.removeFirst()
                
                if visitedB.contains(current) { return result-1 }
                
                for i in 0..<current.count {
                    for ch in possibleChars {
                        var temp = [Character](current); temp[i] = ch
                        let newStr = String(temp)
                        if !visitedA.contains(newStr), dictionary.contains(newStr) {
                            queueA.append(newStr)
                            visitedA.insert(newStr)
                        }
                    }
                }
            }
        }
        
        return -1
    }
}
```
- 常见题型：    
[单词接龙](https://leetcode-cn.com/problems/word-ladder/)  
[最小基因变化](https://leetcode-cn.com/problems/minimum-genetic-mutation/)

----
###高级搜索--A*

通常使用自定义优先级的优先队列`PriorityQueue`，在遍历时每次从优先队列中取出优先级最高的，则可以以更快方式得到解，因为估价函数的值代表了更加接近最终结果的权重。

- 常见题型:  
[二进制矩阵中的最短路径](https://leetcode-cn.com/problems/shortest-path-in-binary-matrix/)  
[滑动谜题](https://leetcode-cn.com/problems/sliding-puzzle/)  
[解数独](https://leetcode-cn.com/problems/sudoku-solver/)  
[单词搜索 II ](https://leetcode-cn.com/problems/word-search-ii/)  

----
###红黑树
