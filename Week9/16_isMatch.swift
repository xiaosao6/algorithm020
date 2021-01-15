class Solution {
    
    // DP
    // 参考题解：https://leetcode-cn.com/problems/wildcard-matching/solution/dong-tai-gui-hua-dai-zhu-shi-by-tangweiqun/
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        if p.isEmpty { return s.isEmpty }
        
        let chars_s = Array(s), chars_p = Array(p)
        let len_s = chars_s.count, len_p = chars_p.count
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: len_p+1), count: len_s+1)
        
        dp[0][0] = true
        for k in 1...len_p { // 第一行
            dp[0][k] = dp[0][k-1] && chars_p[k-1] == "*"
        }
        
        var idx_s = 1, idx_p = 1
        
        while idx_s <= len_s {
            idx_p = 1
            while idx_p <= len_p {
                if chars_s[idx_s-1] == chars_p[idx_p-1] || chars_p[idx_p-1] == "?" {
                    dp[idx_s][idx_p] = dp[idx_s-1][idx_p-1]
                }
                else if chars_p[idx_p-1] == "*" {
                    dp[idx_s][idx_p] = dp[idx_s][idx_p-1] || dp[idx_s-1][idx_p]
                }
                idx_p += 1
            }
            idx_s += 1
        }
        
        return dp.last!.last!
    }
}
