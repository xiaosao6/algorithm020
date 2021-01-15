class Solution {
    
    // DP
    // 参考题解：https://leetcode-cn.com/problems/distinct-subsequences/solution/pythonti-jie-yi-kan-jiu-dong-de-fen-xi-yao-yao-yao/
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        
        if s.isEmpty || t.isEmpty { return 0 }
        
        let chars_s = Array(s), chars_t = Array(t)
        let len_s = chars_s.count, len_t = chars_t.count
        
        // s放在行， t放在列
        var dp = [[Int]](repeating: [Int](repeating: 0, count: len_s+1), count: len_t+1)
        
        for k in 0...len_s { // 初始化第一行
            dp[0][k] = 1
        }
        
        for idx_t in 1...len_t {
            for idx_s in 1...len_s {
                if chars_s[idx_s - 1] == chars_t[idx_t - 1] {
                    dp[idx_t][idx_s] = dp[idx_t-1][idx_s-1] + dp[idx_t][idx_s-1]
                } else {
                    dp[idx_t][idx_s] = dp[idx_t][idx_s-1]
                }
            }
        }
        
        return dp.last!.last!
    }
}
