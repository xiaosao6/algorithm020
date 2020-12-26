class Solution {
    
//    [2],
//    [3,4],
//    [6,5,7],
//    [4,1,8,3]
//    三角形问题转化为矩形的最小路径和问题
    
    // DP解法,优化空间为一维
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        // i代表行索引，j代表列索引
        // 递推公式：f(i,j) = min(f(i+1,j), f(i+1,j+1)) + value(i,j)
        
        if triangle.isEmpty { return 0 }
        
        var dpArray = [Int](repeating: 0, count: triangle.last!.count+1)
        
        // 自底向上，倒序递推
        
        for i in (0..<triangle.count).reversed() {
            
            for j in (0..<triangle[i].count) {
                
                dpArray[j] = min(dpArray[j], dpArray[j+1]) + triangle[i][j]
                
            }
        }
        
        return dpArray[0]
    }
}
