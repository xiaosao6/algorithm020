class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count < 2 { return 0 }

        // 从第二天开始，只要比前一天价格高就卖掉

        var result = 0

        for i in 1..<prices.count {
            result += max(0, prices[i] - prices[i-1])
        }
        
        return result
    }
}