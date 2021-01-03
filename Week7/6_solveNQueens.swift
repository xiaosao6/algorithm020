
class Solution {
    
    private var cols = Set<Int>()
    private var pie = Set<Int>()
    private var na = Set<Int>()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        
        let row = [Bool](repeating: false, count: n)
        let board = [[Bool]](repeating: row, count: n)
        
        var boards = [[[Bool]]]()
        
        backTrack(n: n, row: 0, current: board, result: &boards)
        
        let newboards: [[String]] = boards.map{ $0.map{ $0.reduce("") { $0 + ($1 ? "Q" : ".") } } }
        return newboards
    }
    
    private func backTrack(n: Int, row: Int, current: [[Bool]], result: inout [[[Bool]]]) {
        
        if row == n {
            result.append(current)
            return
        }
        
        for col in 0..<n where (!cols.contains(col)
                             && !pie.contains(row+col)
                             && !na.contains(row-col)) {
            
            cols.insert(col)
            pie.insert(row+col)
            na.insert(row-col)
            
            var temp = current
            temp[row][col] = true
            backTrack(n: n, row: row+1, current: temp, result: &result)
            
            cols.remove(col)
            pie.remove(row+col)
            na.remove(row-col)
        }
    }
}
