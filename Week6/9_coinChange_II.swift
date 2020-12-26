
class Solution {
    
    // DP方法
    // dp[i][j]表示前i个硬币，刚好凑到j面值的组合数
    // 参考题解： https://zhuanlan.zhihu.com/p/144384705
    
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        
        if amount == 0 { return 1 } //凑到0，只有一种方式就是不选任何硬币
        if coins.isEmpty { return 0 }
        
        let n = coins.count
        
        var row = [Int](repeating: 0, count: amount+1)
        row[0] = 1 // 金额为0，只有一种凑法（不选任何硬币）
        var dp = [[Int]](repeating: row, count: n+1)
        
        for i in 1...n {
            for j in 1...amount {
                if j < coins[i-1] { // 不选择第i个硬币
                    dp[i][j] = dp[i-1][j]
                } else {
                    dp[i][j] = dp[i-1][j] + dp[i][j - coins[i-1]]
                }
            }
        }
        
        return dp[n][amount]
    }
    
}
