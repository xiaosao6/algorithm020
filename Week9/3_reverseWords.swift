class Solution {
    
    // 参考题解:https://leetcode-cn.com/problems/reverse-words-in-a-string/solution/zi-jie-ti-ku-151-zhong-deng-fan-zhuan-zi-zm4k/
    
    func reverseWords(_ s: String) -> String {
        
        let chars = Array(s)
        if chars.isEmpty { return "" }
        
        var result = ""
        var idx = chars.count - 1 // 索引指针
        
        while idx >= 0 {
            if chars[idx] == " " {
                idx -= 1 // 是空格, 继续前移
                continue
            }
            
            while idx >= 0, chars[idx] != " " {
                idx -= 1 // 找到一个单词的首字母前面的空格
            }
            
            let temp = idx // 暂存, idx向后去寻找单词末尾索引
            idx += 1 // 指向单词首字母
            
            while idx < chars.count, chars[idx] != " " {
                result.append(chars[idx]) // 逐个字母追加
                idx += 1
            }
            result.append(" ") // 加一个空格作为单词分隔符
            
            idx = temp // 回到暂存的索引
        }
        
        if result.last == " " {
            result.removeLast() // 移除末尾多余的空格
        }
        
        return result
    }
}
