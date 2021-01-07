
// 参考题解:https://leetcode-cn.com/problems/lru-cache/solution/lru-ce-lue-xiang-jie-he-shi-xian-by-labuladong/
// 参考题解2:https://zhuanlan.zhihu.com/p/164720088

/// 双向链表节点
final class ListNode {
    let key: Int
    let value: Int
    weak var prev: ListNode?
    var next: ListNode?
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}

/// 双向链表
struct DoubleList {
    
    private var head: ListNode // 虚拟的
    private var tail: ListNode // 虚拟的
    
    /// 链表长度，时间 O(1)
    private(set) var count: Int
    
    init() {
        head = .init(key: 0, value: 0)
        tail = .init(key: 0, value: 0)
        head.next = tail
        tail.prev = head
        count = 0
    }
    
    /// 在链表尾部添加节点 node，时间 O(1)
    mutating func append(_ node: ListNode) {
        
        (tail.prev)?.next = node
        node.next = tail
        
        node.prev = tail.prev
        tail.prev = node
        
        count += 1
    }
    
    /// 删除链表中的 node 节点（一定存在）, 时间 O(1)
    mutating func remove(_ node: ListNode) {
        
        (node.prev)?.next = node.next
        (node.next)?.prev = node.prev
        
        count -= 1
    }
    
    /// 删除链表中最早一个节点，并返回该节点，时间 O(1)
    mutating func removeFirst() -> ListNode {
        
        guard count > 0 else { fatalError("DoubleList is empty!") }
        
        let node = head.next!
        remove(node)
        return node
    }
}

class LRUCache {
    
    /// 哈希表: key -> Node
    private var hashMap: [Int: ListNode]
    
    /// 双向链表 Node <-> Node <-> Node ...
    private var cache: DoubleList
    
    /// 缓存容量
    private let capacity: Int
    
    init(_ capacity: Int) {
        self.hashMap = .init()
        self.cache = .init()
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        
        guard let node = hashMap[key] else { return -1 }
        put(node.key, node.value) // 可以将 node 移到开头
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        
        let newNode = ListNode(key: key, value: value)
        
        if let oldNode = hashMap[key] {
            cache.remove(oldNode)
            cache.append(newNode)
            hashMap[key] = newNode
        } else {
            if cache.count >= capacity { // 容量已满
                let oldest = cache.removeFirst()
                hashMap[oldest.key] = nil
            }
            cache.append(newNode)
            hashMap[key] = newNode
        }
    }
}

