
class Solution {

    func permuteUnique(_ nums: [Int]) -> [[Int]] {

        var result = [[Int]]()
        __permute(nums, start: 0, end: nums.count - 1, result: &result)
        return result
    }

    private func __permute(_ nums: [Int], start: Int, end: Int, result: inout [[Int]]) {

        if start == end {
            result.append(nums)
            return
        }

        var visited = Set<Int>() // 已经访问过的数值集合, 为了去重

        var array = nums

        for i in start...end {

            if visited.contains(array[i]) {
                continue
            }

            visited.insert(array[i])
            
            array.swapAt(start, i)
            __permute(array, start: start+1, end: end, result: &result)
            array.swapAt(start, i) // 恢复原来的顺序
        }
    }
}
