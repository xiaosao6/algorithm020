
class Solution {
    
    func reverseBits(_ n: Int) -> Int {
        
        var x = n
        var power = 31
        var result = 0
        
        while x != 0 {
            result += (x & 1) << power // (x & 1)表示x的二进制最后一位
            x >>= 1
            power -= 1
        }
        
        return result
    }
}
