
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        var left = 0
        var right = nums.count - 1

        while left <= right {
            
            if nums[left] <= nums[right] { // 如果 [left,right] 递增，直接返回
                return nums[left]
            }
            
            let mid = left + ((right - left) / 2)
            
            if nums[left] <= nums[mid] { // 左半部分有序递增,即旋转点在mid右侧

                left = mid + 1

            } else { // 右半部分有序递增,即旋转点在mid左侧

                right = mid // 注意这里不减1

            }
        }

        return -1

    }
}
