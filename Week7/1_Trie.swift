class Trie {
    
    private var isEndOfWord: Bool
    
    private var nexts: [UInt8: Trie]
    
    init() {
        isEndOfWord = false
        nexts = .init()
    }
    
    func insert(_ word: String) {
        
        if word.isEmpty { return }
        
        var node: Trie? = self
        
        for char in word where char.asciiValue != nil {
            
            let key = char.asciiValue!
            
            if node?.nexts[key] == nil {
                node?.nexts[key] = Trie()
            }
            node = node?.nexts[key]
        }
        node?.isEndOfWord = true
    }
    
    func search(_ word: String) -> Bool {
        return searchPrefix(word)?.isEndOfWord ?? false
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return searchPrefix(prefix) != nil
    }
}

private extension Trie {
    
    func searchPrefix(_ prefix: String) -> Trie? {
        
        var node: Trie? = self
        
        for char in prefix where char.asciiValue != nil {
            
            let key = char.asciiValue!
            
            node = node?.nexts[key]
            
            if node == nil { return nil }
        }
        
        return node
    }
}
