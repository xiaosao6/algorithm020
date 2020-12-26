
class Solution {
    
    // DP方法
    // 参考题解:https://leetcode-cn.com/problems/edit-distance/solution/zi-di-xiang-shang-he-zi-ding-xiang-xia-by-powcai-3/
    
    func minDistance(_ word1: String, _ word2: String) -> Int {
        
        if word1.isEmpty, word2.isEmpty { return 0 }
        
        let arr1 = [Character](" " + word1)
        let arr2 = [Character](" " + word2)
        
        let row = [Int](repeating: 0, count: arr2.count)
        var dp = [[Int]](repeating: row, count: arr1.count)
        
        for k in 0..<arr2.count {
            dp[0][k] = k
        }
        
        for k in 0..<arr1.count {
            dp[k][0] = k
        }
        
        for i in 1..<arr1.count {
            for j in 1..<arr2.count {
                if arr1[i] == arr2[j] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1
                }
            }
        }
        
        return dp.last!.last!
    }
    
}
