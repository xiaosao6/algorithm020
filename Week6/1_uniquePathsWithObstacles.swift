
class Solution {
    
    // 参考题解：https://leetcode-cn.com/problems/unique-paths-ii/solution/jian-dan-dpbi-xu-miao-dong-by-sweetiee/

    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        if obstacleGrid.isEmpty || obstacleGrid[0].isEmpty { return 0 }
        
        if obstacleGrid[0][0] == 1 || obstacleGrid.last?.last == 1 { return 0 }
        
        let rows = obstacleGrid.count
        let cols = obstacleGrid[0].count
        
        // 初始值0代表不可达
        var dpTable = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        
        for row in 0..<rows { // 处理首列
            if obstacleGrid[row][0] == 0 {
                dpTable[row][0] = 1
            } else {
                break
            }
        }
        for col in 0..<cols { // 处理首行
            if obstacleGrid[0][col] == 0 {
                dpTable[0][col] = 1
            } else {
                break
            }
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                if obstacleGrid[row][col] == 0 {
                    dpTable[row][col] = dpTable[row-1][col] + dpTable[row][col-1]
                }
            }
        }
        
        return dpTable[rows-1][cols-1]
    }
    
}
