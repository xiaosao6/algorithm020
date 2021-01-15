class Solution {
    
    func reverseWords(_ s: String) -> String {
        
        if s.isEmpty { return s }
        
        var chars = Array(s)
        var start = 0, end = 0 // 每个单词的首/尾 索引
        var temp: Character
        
        while start < chars.count {
            
            while end < chars.count-1, chars[end+1] != " " {
                end += 1
            } // 此时end指向单词的最后一个字符
            
            var l = start, r = end
            while l < r { // 单词内部翻转
                temp = chars[l]; chars[l] = chars[r]; chars[r] = temp
                l += 1; r -= 1
            }
            
            start = end + 2 // 下一个单词首字母
            end = start
        }
        
        return String(chars)
    }
}
