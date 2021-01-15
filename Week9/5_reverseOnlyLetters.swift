class Solution {
    
    func reverseOnlyLetters(_ S: String) -> String {
        
        if S.isEmpty { return S }
        
        var letters = [Character]()
        
        for ch in S where ch.isLetter {
            letters.append(ch)
        }
        
        letters.reverse()
        
        var str = [Character](S)
        
        for i in 0..<str.count where str[i].isLetter {
            str[i] = letters.removeFirst()
        }
        
        return String(str)
    }
}

extension String {
    
    func char(at offset: Int) -> Character {
        return self[index(self.startIndex, offsetBy: offset)]
    }
}
