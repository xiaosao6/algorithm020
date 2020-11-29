
/// 最小二叉堆

class MinHeap<T: Comparable> {
    
    private var array: [T]
    
    var minValue: T {
        return array[0]
    }
    
    init(items: [T]) {
        self.array = items
    }
    
    func insert(_ item: T) {
        
        array.append(item)
        
        heapifyUp()
    }
    
    func deleteMinValue() -> T {
        
        let result = minValue
        
        array[0] = array[array.count - 1]
        
        array.removeLast()
        
        heapifyDown()
        
        return result
    }
}

private extension MinHeap {
    
    /// 数组末尾逐级向上与父亲节点比较，如果比父亲节点更小，则与父亲节点交换位置，直到自己比父亲节点更大或者已经到顶
    func heapifyUp() {
        
        let insertValue = array[array.count - 1]
        
        var i = array.count - 1
        
        while i > 0, insertValue < array[parent(of: i)] {
            
            array.swapAt(i, parent(of: i))
            
            i = parent(of: i)
        }
    }
    
    /// 数组头部逐级向下找到最小的子节点与自己交换位置，直到子节点都比自己大或者已经到底
    func heapifyDown() {
        
        let value = array[0]
        
        var i = 0
        
        while leftChildIndex(of: i) < array.count, value > array[minChildIndex(of: i)] {
            
            let j = minChildIndex(of: i)
            
            array.swapAt(i, minChildIndex(of: i))
            
            i = j
        }
    }
    
    func parent(of index: Int) -> Int {
        
        return (index - 1) / 2
    }
    
    func leftChildIndex(of index: Int) -> Int {
        
        return (2 * index) + 1
    }
    
    func minChildIndex(of index: Int) -> Int {
        
        let left = (2 * index) + 1
        let right = (2 * index) + 2
        
        return (array[left] < array[right]) ? left : right
    }
}
