
class Solution {
    
    // 单向BFS, 参考：https://leetcode-cn.com/problems/word-ladder/solution/127-dan-ci-jie-long-wei-shi-yao-yao-yong-yan-sou-x/

    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        if !wordList.contains(endWord) { return 0 } // 提前排除
        
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        
        // 使用集合加速查找
        let wordSet = Set<String>(wordList)
        
        // 已经访问过的单词信息字典， Key: 单词， Value: 达到该单词的路径长度
        var visited = [String: Int](dictionaryLiteral: (beginWord, 1))
        
        // 用于BFS的队列
        var queue = [String](arrayLiteral: beginWord)
        
        // 当前正在操作的单词(字符数组)
        var chars: [Character]
        
        while !queue.isEmpty {
            
            let word = queue.removeFirst()
            let path = visited[word] ?? 1 // 这个word的路径长度
            
            for i in 0..<word.count {
                
                chars = [Character](word)
                
                for ch in alphabet {
                    
                    chars[i] = ch
                    
                    let newWord = String(chars)
                    
                    if newWord == endWord {  // 已经找到
                        return path + 1
                    }
                    
                    // 未被访问过，且在集合中
                    if visited[newWord] == nil, wordSet.contains(newWord) {
                        visited[newWord] = path + 1
                        queue.append(newWord)
                    }
                }
            }
        }
        
        return 0
    }
}
