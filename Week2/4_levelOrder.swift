
class Solution {

    func levelOrder(_ root: Node?) -> [[Int]] {
        
        var queue = [Node]() // 先进先出，出队顺序与入队顺序相同

        var result = [[Int]]()

        if let r = root {
            queue.append(r)
        }

        while !queue.isEmpty {

            let count = queue.count
            var values = [Int]()
            
            for i in 0..<count {
                let n = queue.removeFirst()
                values.append(n.val)
                queue.append(contentsOf: n.children)
            }

            result.append(values)
        }

        return result
    }
}