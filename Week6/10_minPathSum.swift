
class Solution {
    
    // DP
    // 参考题解： https://leetcode-cn.com/problems/minimum-path-sum/solution/zui-xiao-lu-jing-he-dong-tai-gui-hua-gui-fan-liu-c/
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        if grid.isEmpty { return 0 }
        
        let rows = grid.count
        let cols = grid[0].count
        
        var dp = [[Int]](grid)
        
        for i in 0..<rows {
            for j in 0..<cols {
                if i == 0, j == 0 {
                    dp[i][j] = grid[i][j]
                } else if i == 0 {
                    dp[i][j] = dp[i][j-1] + grid[i][j]
                } else if j == 0 {
                    dp[i][j] = dp[i-1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
                }
            }
        }
        
        return dp[rows-1][cols-1]
    }
}
