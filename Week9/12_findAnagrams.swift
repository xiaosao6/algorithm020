class Solution {
    
    // 滑动窗口
    // 参考题解:https://leetcode-cn.com/problems/find-all-anagrams-in-a-string/solution/hua-dong-chuang-kou-438-zhao-dao-zi-fu-c-ut38/
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        if s.isEmpty || p.isEmpty || s.count < p.count { return [] }
        
        var target = [Int](repeating: 0, count: 26)
        for ch in p {
            target[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        let s_char = Array(s)
        var result = [Int]()
        var window = Array(s_char[0..<p.count])
        
        var freqs = [Int](repeating: 0, count: 26)
        for ch in window {
            freqs[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        if isEqual(freqs, target) {
            result.append(0)
        }
        
        for i in p.count..<s.count { // 滑动窗口, 更新freqs
            let old = window.removeFirst()
            let old_i = Int(old.asciiValue! - Character("a").asciiValue!)
            freqs[old_i] -= 1
            
            let new = s_char[i]; window.append(new)
            let new_i = Int(new.asciiValue! - Character("a").asciiValue!)
            freqs[new_i] += 1
            
            if isEqual(freqs, target) {
                result.append(i - p.count + 1)
            }
        }
        
        return result
    }
    
    /// 比较频率是否相同
    private func isEqual(_ a: [Int], _ b: [Int]) -> Bool {
        for i in 0..<26 {
            if a[i] != b[i] {
                return false
            }
        }
        return true
    }
}
