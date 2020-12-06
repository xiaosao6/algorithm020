
class Solution {

    // 递归 + 交换法

    func permute(_ nums: [Int]) -> [[Int]] {

        var result = [[Int]]()
        __permute(nums, start: 0, end: nums.count - 1, result: &result)
        return result
    }

    private func __permute(_ nums: [Int], start: Int, end: Int, result: inout [[Int]]) {

        if start == end {
            result.append(nums)
            return
        }

        var array = nums

        for i in start...end {
            array.swapAt(start, i)
            __permute(array, start: start+1, end: end, result: &result)
            array.swapAt(start, i) // 恢复原来的顺序
        }
    }
}
