class Solution {

    // 思路参考题解：https://leetcode-cn.com/problems/jump-game/solution/55-by-ikaruga/
    // 贪心的逻辑：遍历数组时，每次检查能跳到最远的位置是多少，如果到最后不能达到最后位置，则失败

    func canJump(_ nums: [Int]) -> Bool {
        
        var farrestIndex = 0 // 能跳到最远的索引

        for i in 0..<nums.count {
            
            if farrestIndex == nums.count - 1 { return true } // 提前得知结果

            if i > farrestIndex { return false }

            farrestIndex = max(farrestIndex, i + nums[i])
        }

        return true
    }
}