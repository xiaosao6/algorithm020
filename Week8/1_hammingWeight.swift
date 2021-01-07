
class Solution {
    
    // 参考官方题解
    // 关键点: n & （n-1）可以消除最右边的1，因此有多少个1就遍历多少次，不用32次
    
    func hammingWeight(_ n: Int) -> Int {
        
        var x = n
        var result = 0
        
        while x != 0 {
            result += 1
            x = x & (x - 1)
        }
        
        return result
    }
}
