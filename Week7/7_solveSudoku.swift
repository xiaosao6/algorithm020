
class Solution {
    
    // 回溯+剪枝
    // 参考题解：https://leetcode-cn.com/problems/sudoku-solver/solution/37-jie-shu-du-hui-su-sou-suo-suan-fa-xiang-jie-by-/
    
    let N = 9
    
    private let chars: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func solveSudoku(_ board: inout [[Character]]) {
        backtrackSolve(&board)
    }
    
    @discardableResult
    private func backtrackSolve(_ board: inout [[Character]]) -> Bool {
        
        for i in 0..<N {
            for j in 0..<N where board[i][j] == "." {
                for char in chars {
                    if isValid(r: i, c: j, value: char, board: board) {
                        board[i][j] = char
                        if backtrackSolve(&board) { return true }
                        board[i][j] = "." // 无法解出，则恢复状态
                    }
                }
                return false
            }
        }
        
        return true
    }
    
    private func isValid(r: Int, c: Int, value: Character, board: [[Character]]) -> Bool {
        
        for k in 0..<N { //检查同行
            if value == board[r][k] { return false }
        }
        
        for k in 0..<N { //检查同列
            if value == board[k][c] { return false }
        }
        
        let boxInitR = r / 3 * 3
        let boxInitC = c / 3 * 3
        
        for i in 0..<3 {
            for j in 0..<3 {
                if board[boxInitR + i][boxInitC + j] == value { return false }
            }
        }
        
        return true
    }
}
