
class Solution {
    
    // DP
    // 参考题解：https://leetcode-cn.com/problems/longest-valid-parentheses/solution/javadai-ma-de-ji-chong-jie-fa-by-sdwwld/
    
    func longestValidParentheses(_ s: String) -> Int {
        
        if s.isEmpty { return 0 }
        
        let arr = [Character](" " + s)
        let n = arr.count
        
        var result = 0
        var dp = [Int](repeating: 0, count: n)
        
        for i in 2..<n where arr[i] == ")" {
            if arr[i-1] == "(" {
                dp[i] = dp[i-2] + 2
            }
            else if arr[i-1 - dp[i-1]] == "(" {
                dp[i] = dp[i-1] + 2 + dp[i-1 - dp[i-1] - 1]
            }
            result = max(result, dp[i])
        }
        
        return result
    }
    
}
