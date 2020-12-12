
class Solution {
    
    func numIslands(_ grid: [[Character]]) -> Int {
        
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        
        var blocks = grid
        var result = 0
        
        for row in 0..<blocks.count {
            for col in 0..<blocks[0].count {
                if blocks[row][col] == "1" {
                    dfs_markVisited(row: row, col: col, grid: &blocks)
                    result += 1
                }
            }
        }
        return result
    }
    
    private func dfs_markVisited(row: Int, col: Int, grid: inout [[Character]]) {
        
        if !isInGrid(row: row, col: col, grid: grid) { return }
        
        if grid[row][col] != "1" { return } // 已经访问过, 或者为水域
        
        grid[row][col] = "2" // 标记为"已经访问过了"
        
        // 上
        dfs_markVisited(row: row-1, col: col, grid: &grid)
        // 左
        dfs_markVisited(row: row, col: col-1, grid: &grid)
        // 右
        dfs_markVisited(row: row, col: col+1, grid: &grid)
        // 下
        dfs_markVisited(row: row+1, col: col, grid: &grid)
    }
    
    private func isInGrid(row: Int, col: Int, grid: [[Character]]) -> Bool {
        return row >= 0 && row < grid.count
            && col >= 0 && col < grid[0].count
    }
}
