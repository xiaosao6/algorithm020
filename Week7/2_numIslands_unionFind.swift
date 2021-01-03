
class Solution {
    
    // 并查集方法
    // 参考题解：https://leetcode-cn.com/problems/number-of-islands/solution/bing-cha-ji-cha-ji-zhong-lian-tong-fen-liang-de-sh/
    
    func numIslands(_ grid: [[Character]]) -> Int {
        
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        
        let uf = UnionFind(matrix: grid.map{ $0.map{ $0 == "1" ? 1 : 0 } })
        
        let rows = grid.count
        let cols = grid[0].count
        
        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == "1" {
                    if i < rows-1, grid[i+1][j] == "1" { // 下方也是1
                        uf.union(i * cols + j, (i+1) * cols + j)
                    }
                    if j < cols-1, grid[i][j+1] == "1" { // 右方也是1
                        uf.union(i * cols + j, i * cols + (j+1))
                    }
                }
            }
        }
        
        return uf.count
    }
}



class UnionFind {
    
    private var parent: [Int] // 集合的根节点数组
    
    private(set) var count: Int // 相互独立的集合数量
    
    init(matrix: [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count
        count = 0
        parent = .init(repeating: 0, count: rows * cols)
        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == 1 {
                    parent[i * cols + j] = i * cols + j
                    count += 1
                }
            }
        }
    }
    
    func find(_ p: Int) -> Int {
        var x = p
        while x != parent[x] {
            x = parent[x]
        }
        return x
    }
    
    func union(_ p: Int, _ q: Int) {
        let rootP = find(p)
        let rootQ = find(q)
        if rootP != rootQ {
            parent[rootP] = rootQ
            count -= 1
        }
    }
}
