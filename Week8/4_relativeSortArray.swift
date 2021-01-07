
class Solution {
    
    // 参考题解: https://leetcode-cn.com/problems/relative-sort-array/solution/bu-shi-yong-sort-pai-xu-de-jie-fa-1122-shu-zu-de-x/
    
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        
        var temp = [Int](repeating: 0, count: 1001)
        
        // 第一次循环, 用计数排序思路将arr1排进temp
        for e1 in arr1 {
            temp[e1] += 1
        }
        
        var result = [Int]()
        
        // 第二次循环, 将arr1中与arr2相同的元素取出,放到结果中
        for e2 in arr2 {
            while temp[e2] > 0 {
                result.append(e2)
                temp[e2] -= 1
            }
        }
        
        // 第三次循环, 将arr1中与arr2不同的部分追加到结果中
        for i in 0..<temp.count {
            while temp[i] > 0 {
                result.append(i)
                temp[i] -= 1
            }
        }
        
        return result
    }
}
