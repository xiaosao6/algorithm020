class Solution {
    
    // 注意：上一次提交的代码有误

    //DP
    
    // [-2,1,-3,4,-1,2,1,-5,4]
    
    func maxSubArray(_ nums: [Int]) -> Int {
        
        if nums.isEmpty { return 0 }
        
        // 递推公式：dp(i) = max(0, dp[i-1]) + nums[i]
        
        var dpArray = [Int](repeating: 0, count: nums.count)
        dpArray[0] = nums[0]
        
        for i in 1..<nums.count {
            dpArray[i] = max(0, dpArray[i-1]) + nums[i]
        }
        
        return dpArray.max()!
    }
}