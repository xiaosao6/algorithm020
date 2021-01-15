class Solution {
    
    func reverseStr(_ s: String, _ k: Int) -> String {
        
        if s.isEmpty { return "" }
        
        var newStr = [Character](s)
        
        var start = 0
        while start < s.count {
            
            var i = start
            var j = min(start + k - 1, s.count - 1)
            
            while i < j {
                newStr.swapAt(i, j)
                i += 1; j -= 1
            }
            
            start += 2 * k
        }
        
        return String(newStr)
    }
}
