
class Solution {

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        if k == 0 { return [[]] }

        if k == n { return [Array<Int>(1...n)] }

        // ①选择n的情况
        let result1 = (combine(n - 1, k - 1)).map { arr -> [Int] in
            var list = arr
            list.append(n)
            return list
        }

        // ②不选n的情况
        let result2 = combine(n - 1, k) 
        
        // 合并
        return result1 + result2
    }

}
