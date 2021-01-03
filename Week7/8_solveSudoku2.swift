let N = 9

class Solution {
    
    // 回溯+剪枝+A*搜索
    // A*搜索策略: 将所有待填空格按照3个维度空位数总和，从小到大排序
    // 但是执行时间更长了，主要原因可能在于没有每次动态地判断blankCount，待优化A*搜索策略
    
    private let chars: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    func solveSudoku(_ board: inout [[Character]]) {
        backtrackSolve(&board)
    }
    
    @discardableResult
    private func backtrackSolve(_ board: inout [[Character]]) -> Bool {
        
        var emptyPositions = [Position]() //所有空位
        
        for r in 0..<N {
            for c in 0..<N where board[r][c] == "." {
                emptyPositions.append(.init(r: r, c: c))
            }
        }
        
        emptyPositions.sort(by: { (pos1, pos2) -> Bool in
            pos1.blankCount(board) < pos2.blankCount(board)
        })
        
        for position in emptyPositions {
            for char in chars {
                if isValid(r: position.r, c: position.c, value: char, board: board) {
                    board[position.r][position.c] = char
                    if backtrackSolve(&board) { return true }
                    board[position.r][position.c] = "." // 无法解出，则恢复状态
                }
            }
            return false
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

struct Position {
    let r: Int
    let c: Int
    
    //行、列、box, 空位数总和
    func blankCount(_ board: [[Character]]) -> Int {
        
        var result = 0
        //遍历同行
        for k in 0..<N where board[r][k] == "." { result += 1 }
        //遍历同列
        for k in 0..<N where board[k][c] == "." { result += 1 }
        
        let (boxInitR, boxInitC) = (r / 3 * 3, c / 3 * 3)
        //遍历同box
        for i in 0..<3 {
            for j in 0..<3 where board[boxInitR + i][boxInitC + j] == "." {
                result += 1
            }
        }
        
        return result
    }
}



