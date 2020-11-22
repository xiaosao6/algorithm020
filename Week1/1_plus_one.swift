class Solution {
    
    func plusOne(_ digits: [Int]) -> [Int] {

        var result = digits
        var i = digits.count - 1

        while i >= 0 {

            if (digits[i] == 9) {
                result[i] = 0
            } else {
                result[i] += 1
                return result
            }

            i = i - 1
        }

        result.insert(1, at: 0)

        return result
    }
}