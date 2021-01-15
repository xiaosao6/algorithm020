class Solution {
    
    // 双指针
    // 参考题解: https://leetcode-cn.com/problems/valid-palindrome-ii/solution/shan-chu-zuo-zhi-huo-you-zhi-zhen-zi-fu-pan-duan-s/
    
    func validPalindrome(_ s: String) -> Bool {
        
        if s.isEmpty { return true }
        
        let chars = Array(s)
        
        if isPalindrome(chars, l: 0, r: chars.count-1) { return true }
        
        var start = 0, end = chars.count - 1
        
        while start < end {
            
            if chars[start] != chars[end] {
                // 尝试跳过一位
                return isPalindrome(chars, l: start+1, r: end)
                    || isPalindrome(chars, l: start, r: end-1)
            }
            
            start += 1
            end -= 1
        }
        return true
    }
    
    private func isPalindrome(_ s: [Character], l: Int, r: Int) -> Bool {
        
        var start = l, end = r
        
        while start < end {
            
            if s[start] != s[end] { return false }
            
            start += 1
            end -= 1
        }
        
        return true
    }
}
