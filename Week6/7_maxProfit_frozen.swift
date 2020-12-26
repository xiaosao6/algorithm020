
class Solution {
    
    // DP方法
    // 参考题解:https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/solution/yi-tu-miao-dong-jie-fa-by-zi-gei-zi-zu/
    
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.isEmpty { return 0 }
        let n = prices.count
        if n == 1 { return 0 }
        
        var dp_stock = [Int](repeating: 0, count: n) // 持有股票
        var dp_frozen = [Int](repeating: 0, count: n) // 被冻结
        var dp_cash = [Int](repeating: 0, count: n) // 持有现金
        
        dp_stock[0] = -prices[0]
        dp_frozen[0] = 0
        dp_cash[0] = 0
        
        for i in 1..<n {
            dp_stock[i] = max(dp_stock[i-1], dp_cash[i-1] - prices[i])
            dp_frozen[i] = dp_stock[i-1] + prices[i]
            dp_cash[i] = max(dp_cash[i-1], dp_frozen[i-1])
        }
        
        return max(dp_frozen[n-1], dp_cash[n-1])
    }
}
