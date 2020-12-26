
class Solution {
    
    // DP
    // 参考题解:https://leetcode-cn.com/problems/decode-ways/solution/dong-tai-gui-hua-you-ji-dian-yao-zhu-yi-sfs06/
    
    func numDecodings(_ s: String) -> Int {
        
        if s.isEmpty { return 0 }
        if s.hasPrefix("0") { return 0 } // 0开头的, 无法编码
        if s.count == 1 { return 1 }
        
        let arr = [Character](s)
        let n = arr.count
        
        var dp = [Int](repeating: 1, count: n+1)
        
        for i in 2...n {
            if arr[i-1] == "0", "12".contains(arr[i-2]) == false { // 出现0并且不是跟在1或2后面的,无法解码
                return 0
            }
            if ["10", "20"].contains(String([arr[i-2], arr[i-1]])) { // 出现10或20,唯一的解码方式,继承i-2的结果
                dp[i] = dp[i-2]
            }
            else if let intValue = Int(String([arr[i-2], arr[i-1]])), (11...26).contains(intValue) {
                dp[i] = dp[i-1] + dp[i-2] //两种解码方式
            }
            else {
                dp[i] = dp[i-1] //一位数组，一种解码方式
            }
        }
        
        return dp[n]
    }
}
