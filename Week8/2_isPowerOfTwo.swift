class Solution {
    
    // 参考 https://leetcode-cn.com/problems/number-of-1-bits/
    
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n & (n-1) == 0)
    }
}