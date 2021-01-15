class Solution {
    
    // DP
    // 参考题解： https://leetcode-cn.com/problems/longest-increasing-subsequence/solution/zui-chang-shang-sheng-zi-xu-lie-dong-tai-gui-hua-2/
    
    func lengthOfLIS(_ nums: [Int]) -> Int {

        if nums.isEmpty { return 0 }
        
        var dp = [Int](repeating: 1, count: nums.count)
        
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] { // 严格小于
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max()!
    }
}

