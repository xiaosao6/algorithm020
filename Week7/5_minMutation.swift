
class Solution {
    
    // 双向BFS
    // 参考题目：`单词接龙`
    
    private let basics = "ACGT"
    
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        
        let dictionary = Set(bank)
        
        if !dictionary.contains(end) { return -1 }
        
        var result = 0
        
        var visitedA = Set<String>(arrayLiteral: start)
        var visitedB = Set<String>(arrayLiteral: end)
        var queueA = [String](arrayLiteral: start)
        var queueB = [String](arrayLiteral: end)
        
        while !queueA.isEmpty, !queueB.isEmpty {
            
            if queueA.count > queueB.count { // 保证queueA是更短的
                swap(&queueA, &queueB)
                swap(&visitedA, &visitedB)
            }
            
            result += 1
            
            for _ in 0..<queueA.count {
                
                let gene = queueA.removeFirst()
                
                if visitedB.contains(gene) { return max(0, result-1) }
                
                for i in 0..<gene.count {
                    for ch in basics {
                        var temp = [Character](gene); temp[i] = ch
                        let newGene = String(temp)
                        if !visitedA.contains(newGene), dictionary.contains(newGene) {
                            queueA.append(newGene)
                            visitedA.insert(newGene)
                        }
                    }
                }
            }
        }
        
        return -1
    }
}
