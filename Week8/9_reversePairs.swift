
class Solution {
    
    // 参考题解：https://leetcode-cn.com/problems/reverse-pairs/solution/shou-hua-tu-jie-yi-bu-yi-bu-jie-xi-gui-bing-pai-xu/
    
    func reversePairs(_ nums: [Int]) -> Int {
        
        if nums.count < 2 { return 0 }
        
        var arr = nums
        
        var count = 0
        mergeSort(nums: &arr, start: 0, end: nums.count-1, count: &count)
        return count
    }
    
    private func mergeSort(nums: inout [Int], start: Int, end: Int, count: inout Int) {
        
        guard start < end else { return }
        
        let mid = start + ((end - start) >> 1)
        
        mergeSort(nums: &nums, start: start, end: mid, count: &count)
        mergeSort(nums: &nums, start: mid+1, end: end, count: &count)
        
        var i = start
        var j = mid + 1
        
        while i <= mid, j <= end {
            if Int64(nums[i]) > 2 * Int64(nums[j]) {
                count += mid - i + 1
                j += 1
            } else {
                i += 1
            }
        }
        
        var temp = [Int](repeating: 0, count: end - start + 1)
        i = start
        j = mid + 1
        var idx = 0
        
        while i <= mid, j <= end {
            temp[idx] = min(nums[i], nums[j])
            if nums[i] < nums[j] {
                i += 1
            } else {
                j += 1
            }
            idx += 1
        }
        
        while i <= mid {
            temp[idx] = nums[i]
            idx += 1; i += 1
        }
        
        while j <= end {
            temp[idx] = nums[j]
            idx += 1; j += 1
        }
        
        i = 0; j = start
        while j <= end {
            nums[j] = temp[i]
            i += 1; j += 1
        }
    }
}
