
class Solution {
    
    // 参考题解:https://leetcode-cn.com/problems/house-robber-ii/solution/tong-yong-si-lu-tuan-mie-da-jia-jie-she-wen-ti-by-/
    
    // DP方法
    // [2,7,9,3,1]
    // 与简单版的`打家劫舍`区别在于, 将问题分为两种情况:偷了第一个房屋 / 不偷第一个房屋
    
    func rob(_ nums: [Int]) -> Int {
        
        if nums.isEmpty { return 0 }
        let n = nums.count
        if n == 1 { return nums[0] }
        if n == 2 { return max(nums[0], nums[1]) }
        
        // 偷了第一个房屋
        var array1 = nums
        array1.removeFirst(2)
        array1.removeLast() // 因为是环形的, 所以末尾也不能偷
        let value1 = nums[0] + __rob(array1)
        
        // 不偷第一个房屋
        var array2 = nums
        array2.removeFirst()
        let value2 = __rob(array2)
        
        return max(value1, value2)
    }
    
    private func __rob(_ nums: [Int]) -> Int {
        
        if nums.isEmpty { return 0 }
        let n = nums.count
        if n == 1 { return nums[0] }
        
        var dp_notRob = [Int](repeating: 0, count: n) // 某位置不偷,可偷到的最大值
        var dp_rob = [Int](repeating: 0, count: n) // 某位置偷,可偷到的最大值
        dp_notRob[0] = 0
        dp_rob[0] = nums[0]
        
        for i in 1..<n {
            dp_rob[i] = nums[i] + dp_notRob[i-1] // i位置要偷, 前一个就不能偷
            dp_notRob[i] = max(dp_notRob[i-1], dp_rob[i-1]) // i位置不偷, 取前一个偷或不偷中的最大值
        }
        
        return max(dp_notRob.last!, dp_rob.last!)
    }
}
