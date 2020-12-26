class Solution {
    
    //使用DP
    //参考：https://leetcode-cn.com/problems/coin-change/solution/zi-di-xiang-shang-dong-tai-gui-hua-by-pendygg/
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        
        var dpArr = [Int](repeating: amount+1, count: amount+1)
        dpArr[0] = 0
        
        for i in 0...amount {
            for coin in coins where i >= coin {
                // dpArr[i]代表凑够面值i所需的最少硬币个数
                // dpArr[i-coin] + 1 代表前一个选择的硬币个数（使用当前硬币coin，因此个数+1）
                dpArr[i] = min(dpArr[i], dpArr[i-coin] + 1)
            }
        }
        
        return (dpArr[amount] == amount+1) ? -1 : dpArr[amount]
    }
}