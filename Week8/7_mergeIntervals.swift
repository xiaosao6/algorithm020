
class Solution {
    
    // 参考官方题解:https://leetcode-cn.com/problems/merge-intervals/solution/he-bing-qu-jian-by-leetcode-solution/
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        if intervals.isEmpty || intervals[0].isEmpty { return [] }
        
        // 按照左边界排序
        let sorted = intervals.sorted { (e1, e2) -> Bool in
            e1[0] < e2[0]
        }
        
        var result = [[Int]]()
        
        for interval in sorted {
            if result.isEmpty || (result.last!)[1] < interval[0] { // 区间没有交集,直接追加
                result.append(interval)
            } else { // 合并(更新右边界)
                result[result.count-1][1] = max(result[result.count-1][1], interval[1])
            }
        }
        
        return result
    }
}
