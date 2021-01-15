class Solution {
    
    func myAtoi(_ s: String) -> Int {
        
        if s.isEmpty { return 0 } // ①为空
        
        var noSpaceStr = s.trimmingCharacters(in: .whitespaces) // 不含首尾空格的字符串
        
        if noSpaceStr.isEmpty { return 0 } // ②全部是空格
        
        let firstChar = noSpaceStr.first!
        
        guard "+-0123456789".contains(firstChar) else { return 0 } // ②前缀不合法
        
        var positive = true
        
        if firstChar == "-" {
            positive = false
            noSpaceStr = String(noSpaceStr.dropFirst())
        } else if firstChar == "+" {
            noSpaceStr = String(noSpaceStr.dropFirst())
        }
        
        for (i, ch) in noSpaceStr.enumerated() {
            if !"0123456789".contains(ch) {
                noSpaceStr = String(noSpaceStr.substr(0..<i))
                break
            }
        }
        
        var num = 0
        
        while !noSpaceStr.isEmpty {
            let ch = noSpaceStr.removeFirst()
            let value = Int("\(ch)") ?? 0
            
            if (positive ? num : -num) > Int(Int32.max) { return Int(Int32.max) }
            if (positive ? num : -num) < Int(Int32.min) { return Int(Int32.min) }
            
            num = (num * 10) + value
        }
        
        let newNum = positive ? num : -num
        
        if newNum < Int(Int32.min) {
            return Int(Int32.min)
        }
        if newNum > Int(Int32.max) {
            return Int(Int32.max)
        }
        return newNum
    }
    
}
extension String {
    
    func substr(_ range: Range<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        return self[start..<index(start, offsetBy: range.count)]
    }
}
