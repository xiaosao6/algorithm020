class Solution {

    // 参考题解的思路1：https://leetcode-cn.com/problems/jump-game-ii/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-10/

    // 贪心逻辑：每次都在当前位置的可跳范围内选择能跳到的最远位置

    func jump(_ nums: [Int]) -> Int {

        var result = 0 //结果：需要跳跃的最小次数

        var end = 0 // 当前位置可跳范围的右边界
        var maxIndex = 0 // 当前位置可跳范围中，能跳到的最大索引

        for i in 0..<nums.count-1 {
            maxIndex = max(maxIndex, nums[i] + i)
            if i == end {
                end = maxIndex
                result += 1
            }
        }

        return result
    }
}