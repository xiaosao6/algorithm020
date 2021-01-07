
class Solution {
    
    // 位运算
    
    func totalNQueens(_ n: Int) -> Int {
        
        if n < 1 { return 0 }
        
        var count = 0
        dfs(n: n, row: 0, cols: 0, pie: 0, na: 0, count: &count)
        return count
    }
    
    private func dfs(n: Int, row: Int,
                     cols: Int, pie: Int, na: Int,
                     count: inout Int) {
        
        if row == n {
            count += 1
            return
        }
        
        var bits = (~(cols | pie | na)) & ((1 << n) - 1) //当前可放的所有空位
        
        while bits != 0 {
            
            let p = bits & -bits //取到最低位的1
            
            dfs(n: n, row: row + 1,
                cols: cols | p, pie: (pie | p) << 1, na: (na | p) >> 1,
                count: &count)
            
            // 因为cols、pie、na是值传递，无需reverse state
            
            bits = bits & (bits - 1) //清除最低位的1
        }
    }
}
