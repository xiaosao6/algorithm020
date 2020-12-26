
class Solution {
    
    // DP方法
    // 只比https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/submissions/
    // 多了一个手续费
    
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        
        if prices.isEmpty { return 0 }
        if prices.count == 1 { return 0 }
        
        let n = prices.count
        
        // 在第i天手里持有stock时，手里的现金值
        var dp_stock = [Int](repeating: 0, count: n)
        // 在第i天手里持有cash的值
        var dp_cash = [Int](repeating: 0, count: n)
        
        dp_stock[0] = -prices[0]
        dp_cash[0] = 0
        
        for i in 1..<n {
            dp_stock[i] = max(dp_stock[i-1], dp_cash[i-1] - prices[i]) //昨天到今天都持stock, 昨天持cash今天买入, 取最大值
            dp_cash[i] = max(dp_cash[i-1], dp_stock[i-1] + prices[i] - fee) //昨天到今天都持cash, 昨天持stock今天卖出， 取最大值
        }
        
        return dp_cash[n-1]
    }
    
}
