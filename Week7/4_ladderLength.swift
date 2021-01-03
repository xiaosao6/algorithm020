class Solution {
    
    // 双向BFS
    // 参考题解：https://leetcode-cn.com/problems/word-ladder/solution/python3-bfshe-shuang-xiang-bfsshi-xian-dan-ci-jie-/
    
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        let dictionary = Set(wordList)
        
        if !dictionary.contains(endWord) { return 0 }
        
        var result = 0
        
        var visitedA = Set<String>(arrayLiteral: beginWord)
        var visitedB = Set<String>(arrayLiteral: endWord)
        var queueA = [String](arrayLiteral: beginWord)
        var queueB = [String](arrayLiteral: endWord)
        
        while !queueA.isEmpty, !queueB.isEmpty {
            
            if queueA.count > queueB.count { // 保证queueA是更短的
                swap(&queueA, &queueB)
                swap(&visitedA, &visitedB)
            }
            
            result += 1
            
            for _ in 0..<queueA.count {
                
                let word = queueA.removeFirst()
                
                if visitedB.contains(word) { return result }
                
                for i in 0..<word.count {
                    for ch in alphabet {
                        var temp = [Character](word); temp[i] = ch
                        let newWord = String(temp)
                        if !visitedA.contains(newWord), dictionary.contains(newWord) {
                            queueA.append(newWord)
                            visitedA.insert(newWord)
                        }
                    }
                }
            }
        }
        
        return 0
    }
    
}
