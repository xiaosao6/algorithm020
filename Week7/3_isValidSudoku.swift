
class Solution {
    
    // 参考题解：https://leetcode-cn.com/problems/valid-sudoku/solution/javawei-yun-suan-1ms-100-li-jie-fang-ge-suo-yin-by/
    
    let N = 9
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var rowSets = Array<Set<Int>>(repeating: Set<Int>(), count: N)
        var colSets = Array(rowSets)
        var boxSets = Array(rowSets)
        
        for r in 0..<N {
            for c in 0..<N where board[r][c] != "." {
                
                let value = Int(String(board[r][c]))!
                
                if rowSets[r].contains(value)
                    || colSets[c].contains(value)
                    || boxSets[r/3*3 + c/3].contains(value) {
                    return false
                }
                
                rowSets[r].insert(value)
                colSets[c].insert(value)
                boxSets[r/3*3 + c/3].insert(value)
            }
        }
        
        return true
    }
}
