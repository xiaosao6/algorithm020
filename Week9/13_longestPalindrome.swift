class Solution {
    
    // DP
    // 参考题解:https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zhong-xin-kuo-san-dong-tai-gui-hua-by-liweiwei1419/
    
    func longestPalindrome(_ s: String) -> String {
        
        let size = s.count
        if size < 2 { return s }
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
        let chars = Array(s)
        
        var maxLength = 1 // 最长子串的长度
        var startIndex = 0 // 最长子串起始索引
        
        for i in 0..<size { dp[i][i] = true }
        
        for j in 1..<size {
            for i in 0..<j {
                if chars[i] != chars[j] {
                    dp[i][j] = false
                } else {
                    if j - i < 3 { // 示例: "aa"   "aba"
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i+1][j-1] // 递推: i右移, j左移
                    }
                }
                
                if dp[i][j] == true, j - i + 1 > maxLength { // [i...j]是回文
                    maxLength = j - i + 1
                    startIndex = i
                }
            }
        }
        
        let sub = chars[startIndex..<(startIndex + maxLength)]
        return String(sub)
    }
}
