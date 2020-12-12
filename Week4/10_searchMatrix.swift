
class Solution {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        if matrix.isEmpty || matrix[0].isEmpty { return false }
        
        if target < matrix.first!.first! || target > matrix.last!.last! { return false }
        
        // 因为题目说：每行的第一个整数大于前一行的最后一个整数, 所以可以这么做：
        // 扁平化为一维数组
        let values = matrix.flatMap{ $0 }
        
        var left = 0
        var right = values.count - 1
            
        while left <= right {
            
            let mid = left + ((right - left) / 2)
            
            if values[mid] == target {
                return true
            } else if values[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
}
