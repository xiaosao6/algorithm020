
class Solution {
    
    // 参考题解： https://leetcode-cn.com/problems/isomorphic-strings/solution/suo-yin-yuan-zu-dan-shuang-ha-xi-biao-5j-mxra/
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        
        if s.isEmpty { return true }
        
        var dict = [Character: Character]()
        let chars_s = Array(s), chars_t = Array(t)
        
        for i in 0..<chars_s.count {
            
            let char1 = chars_s[i], char2 = chars_t[i]
            
            if let value = dict[char1], value != char2 {
                return false
            }
            if dict[char1] == nil, dict.values.contains(char2) {
                return false
            }
            
            dict[char1] = char2
        }
        
        return true
    }
}
