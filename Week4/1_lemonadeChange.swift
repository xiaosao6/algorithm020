class Solution {

    // 参考思路：https://leetcode-cn.com/problems/lemonade-change/solution/ning-meng-shui-zhao-ling-by-leetcode/

    func lemonadeChange(_ bills: [Int]) -> Bool {
        
        var fiveCount = 0
        var tenCount = 0

        for bill in bills {

            if bill == 5 {

                fiveCount += 1

            } else if bill == 10 {
                
                if fiveCount == 0 { return false }

                fiveCount -= 1
                tenCount += 1

            } else if bill == 20 {
                
                if fiveCount > 0, tenCount > 0 { // 优先把10元用掉
                    fiveCount -= 1
                    tenCount -= 1
                } else if fiveCount >= 3 {
                    fiveCount -= 3
                } else {
                    return false
                }
            }

        }

        return true
    }
}