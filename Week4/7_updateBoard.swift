
class Solution {
    
    private let directions: (x: [Int], y: [Int]) =
        ([-1, 1,  0, 0,   -1,  1, -1, 1],
         [ 0, 0, -1, 1,   -1, -1,  1, 1])
        // 左  右  上  下   左上 右上 左下 右下
    
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        
        if click.count != 2 { return [] }
        
        let row = click.first!
        let col = click.last!
        
        var newBoard = board
        
        if board[row][col] == "M" { // ①是否挖到地雷, 是: 结束; 否:后续流程
            newBoard[row][col] = "X"
        } else {
            // ②揭露当前方块
            // ③递归遍历(DFS或BFS): 每个方块周围是否有地雷, 判断周围共有多少地雷并记录数字
            _dfs_update(row: row, col: col, &newBoard)
        }
        
        return newBoard
    }
    
    private func _dfs_update(row: Int, col: Int, _ board: inout [[Character]]) {
        
        var count = 0 // 该点周围的雷的数量
        
        for k in 0..<8 {
            let r = row + directions.y[k]
            let c = col + directions.x[k]
            if !isInGrid(row: r, col: c, grid: board) { continue }
            if board[r][c] == "M" {
                count += 1
            }
        }
        
        if count > 0 {
            board[row][col] = Character("\(count)")
        } else {
            board[row][col] = "B"
            for k in 0..<8 {
                let r = row + directions.y[k]
                let c = col + directions.x[k]
                if (!isInGrid(row: r, col: c, grid: board)) || board[r][c] != "E" { continue }
                _dfs_update(row: r, col: c, &board)
            }
        }
    }
    
    private func isInGrid(row: Int, col: Int, grid: [[Character]]) -> Bool {
            return row >= 0 && row < grid.count
                && col >= 0 && col < grid[0].count
    }
}
