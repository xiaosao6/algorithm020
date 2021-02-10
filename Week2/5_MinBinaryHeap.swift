
/// 二叉堆

struct BinaryHeap<T: Comparable> {
    
    var isEmpty: Bool { array.isEmpty }
    
    var peek: T? { array.first }
    
    private var array: [T]
    
    private let ordering: (T, T) -> Bool
    
    init(order: @escaping (T, T) -> Bool, items: [T]) {
        ordering = order
        array = []
        for item in items {
            add(item)
        }
    }
    
    mutating func add(_ element: T) {
        
        array.append(element)
        
        heapifyUp()
    }
    
    mutating func removePeek() -> T? {
        
        let result = peek
        
        array[0] = array[array.count - 1]
        
        array.removeLast()
        
        heapifyDown()
        
        return result
    }
}

private extension BinaryHeap {
    
    mutating func heapifyUp() {
        
        let insertValue = array[array.count - 1]
        
        var i = array.count - 1
        
        while i > 0, ordering(insertValue, array[parent(of: i)]) {
            
            array.swapAt(i, parent(of: i))
            
            i = parent(of: i)
        }
    }
    
    mutating func heapifyDown() {
        
        if array.isEmpty { return }
        
        let value = array[0]
        
        var i = 0
        
        while leftChildIndex(of: i) < array.count,
              let j = priorChildIndex(of: i), ordering(array[j], value) {
            
            array.swapAt(i, j)
            
            i = j
        }
    }
    
    func parent(of index: Int) -> Int {
        
        return (index - 1) / 2
    }
    
    func leftChildIndex(of index: Int) -> Int {
        
        return (2 * index) + 1
    }
    
    func priorChildIndex(of index: Int) -> Int? {
        
        let left = (2 * index) + 1
        let right = (2 * index) + 2
        
        if left >= 0, left < array.count,
           right >= 0, right < array.count {
            return ordering(array[left], array[right]) ? left : right
        }
        if right < 0 || right >= array.count {
            return left
        }
        if left < 0 || left >= array.count {
            return right
        }
        
        return nil
    }
}

extension BinaryHeap: CustomStringConvertible {
    
    var description: String { array.description }
    
}
