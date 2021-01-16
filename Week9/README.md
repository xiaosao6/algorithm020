----
### 高级DP  


- 复杂度来源:  

	- 状态有更多维度（二维，三维，...可能需要压缩）

	- 状态转移方程更加复杂

- 常见题型:

[使用最小花费爬楼梯](https://leetcode-cn.com/problems/min-cost-climbing-stairs/)  
[解码方法](https://leetcode-cn.com/problems/decode-ways/)  
[最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses/)  
[最大矩形](https://leetcode-cn.com/problems/maximal-rectangle/)  
[不同的子序列](https://leetcode-cn.com/problems/distinct-subsequences/)  

- [不同路径II](https://leetcode-cn.com/problems/unique-paths-ii/) DP方程:

```Swift

	for r in 1..<rows {
	
   		for c in 1..<cols where obstacleGrid[r][c] == 0 {
   		
       		dp[r][c] = dp[r-1][c] + dp[r][c-1]
		}
	}
	
```

----

### 字符串

- 常见题目分类：

	- 基础问题：  转化大小写，转换整型，等等
	- 操作问题：  判断前缀，翻转字母，等等
	- 异位词问题： 哈希思想
	- 回文串问题： 双指针
	- 最长子串 / 子序列问题： 结合DP  
	- 字符串 + DP问题
	
- 字符串匹配算法

	- 暴力
	- [Rabin - Karp 算法](https://shimo.im/docs/1wnsM7eaZ6Ab9j9M)  
	- [KMP 算法](http://www.ruanyifeng.com/blog/2013/05/Knuth–Morris–Pratt_algorithm.html)


- 常见题型:  
	见本周作业字符串相关题目