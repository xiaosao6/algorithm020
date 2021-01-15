class Solution {
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        if obstacleGrid.isEmpty || obstacleGrid[0].isEmpty { return 0 }
        
        if obstacleGrid.first!.first == 1 || obstacleGrid.last!.last! == 1 { return 0 }
        
        let rows = obstacleGrid.count
        let cols = obstacleGrid[0].count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        
        for r in 0..<rows { // 处理首列
            if obstacleGrid[r][0] == 0 {
                dp[r][0] = 1
            } else { // 剩余的走不通了
                break
            }
        }
        
        for c in 0..<cols { // 处理首行
            if obstacleGrid[0][c] == 0 {
                dp[0][c] = 1
            } else { // 剩余的走不通了
                break
            }
        }
        
        for r in 1..<rows {
            for c in 1..<cols where obstacleGrid[r][c] == 0 {
                dp[r][c] = dp[r-1][c] + dp[r][c-1]
            }
        }
        
        return dp.last!.last!
    }
    
}
