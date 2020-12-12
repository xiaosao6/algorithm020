class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var left = 0
        var right = nums.count - 1

        while left <= right {

            let mid = left + ((right - left) / 2)

            if nums[mid] == target { return mid }

            // 要特别注意等号的情况，可以用较少元素的数组来测试
            else if nums[left] <= nums[mid] { // 左半部分有序递增

                if nums[left] <= target, target < nums[mid] { // 目标在左半部分
                    right = mid - 1
                } else {
                    left = mid + 1
                }

            } else { // 右半部分有序递增

                if nums[right] >= target, target > nums[mid] { // 目标在右半部分
                    left = mid + 1
                } else {
                    right = mid - 1
                }

            }
        }

        return -1

    }
}