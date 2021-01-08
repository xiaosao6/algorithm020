
func heapSort(_ array: inout [Int]) {
    
    guard array.count > 1 else { return }
    
    var heap = PriorityQueue<Int>(order: <, startingValues: array)
    
    for i in 0..<array.count {
        array[i] = heap.pop()!
    }
}

/// 优先队列
struct PriorityQueue<T: Comparable> {
    
    private var heap = [T]() // 二叉堆
    
    private let ordered: (T, T) -> Bool // 排序函数
    
    init(order: @escaping (T, T) -> Bool, startingValues: [T] = []) {
        ordered = { !order($0, $1) }
        
        heap = startingValues
        var i = heap.count/2 - 1
        while i >= 0 {
            sink(i)
            i -= 1
        }
    }
    
    var count: Int { return heap.count }
    
    var isEmpty: Bool { return heap.isEmpty }
    
    /// 加入一个新元素, O(log n)
    mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    /// 移除最优先元素, O(log n)
    mutating func pop() -> T? {
        
        if heap.isEmpty { return nil }
        let count = heap.count
        if count == 1 { return heap.removeFirst() }
        fastPop(newCount: count - 1)
        
        return heap.removeLast()
    }
    
    /// 最优先元素, O(1)
    func peek() -> T? {
        return heap.first
    }
    
    mutating func clear() {
        heap.removeAll(keepingCapacity: false)
    }
}

private extension PriorityQueue {
    
    mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            
            var j = 2 * index + 1
            
            if j < (heap.count - 1) && ordered(heap[j], heap[j + 1]) { j += 1 }
            if !ordered(heap[index], heap[j]) { break }
            
            heap.swapAt(index, j)
            index = j
        }
    }
    
    mutating func fastPop(newCount: Int) {
        var index = 0
        heap.withUnsafeMutableBufferPointer { bufferPointer in
            let _heap = bufferPointer.baseAddress!
            swap(&_heap[0], &_heap[newCount])
            while 2 * index + 1 < newCount {
                var j = 2 * index + 1
                if j < (newCount - 1) && ordered(_heap[j], _heap[j+1]) { j += 1 }
                if !ordered(_heap[index], _heap[j]) { return }
                swap(&_heap[index], &_heap[j])
                index = j
            }
        }
    }
    
    mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}

extension PriorityQueue: CustomStringConvertible, CustomDebugStringConvertible {
    
    var description: String { return heap.description }
    var debugDescription: String { return heap.debugDescription }
}
