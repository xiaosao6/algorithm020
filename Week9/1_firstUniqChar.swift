class Solution {
    
    func firstUniqChar(_ s: String) -> Int {
        
        if s.isEmpty { return -1 }
        
        var arr = [Int](repeating: 0, count: 26)
        
        for ch in s {
            let idx = ch.asciiValue! - Character("a").asciiValue!
            arr[Int(idx)] += 1
        }
        
        for (i, ch) in s.enumerated() {
            let idx = ch.asciiValue! - Character("a").asciiValue!
            if arr[Int(idx)] == 1 {
                return i
            }
        }
        
        return -1
    }
}