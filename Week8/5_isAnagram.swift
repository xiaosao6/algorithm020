
class Solution {
    
    // 如果全是小写字母的话, 用计数排序的思路即可
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        var array = [Int](repeating: 0, count: 26) // a...z
        
        for ch1 in s {
            let offset = ch1.asciiValue! - Character("a").asciiValue!
            array[Int(offset)] += 1
        }
        
        for ch2 in t {
            let offset = ch2.asciiValue! - Character("a").asciiValue!
            array[Int(offset)] -= 1
            if array[Int(offset)] < 0 {
                return false
            }
        }
        
        for ch in array where ch > 0 {
            return false
        }
        
        return true
    }
    
}

