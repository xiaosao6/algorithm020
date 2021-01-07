
func quickSort(_ array: inout [Int]) {
    
    guard array.count > 1 else { return }
    
    __quickSort(&array, begin: 0, end: array.count-1)
}

/// 快速排序
private func __quickSort(_ array: inout [Int], begin: Int, end: Int) {
    
    guard begin < end else { return }
    
    let pivot = __partition(&array, begin: begin, end: end)
    
    __quickSort(&array, begin: begin, end: pivot-1) // 分治左侧
    __quickSort(&array, begin: pivot+1, end: end)   // 分治右侧
}

/// 根据基准索引pivot，将小于pivot的元素移到pivot左侧，大于pivot的元素移到右侧, 返回pivot
private func __partition(_ array: inout [Int], begin: Int, end: Int) -> Int {
    
    let pivot = end // 任意找一个位置当做基准点
    
    var counter = 0 // 小于pivot的元素个数
    
    for i in begin..<end where array[i] < array[pivot] {
        array.swapAt(i, begin+counter) // 这里的逐步移动，有点类似于插入排序时的逐步移动
        counter += 1
    }
    
    array.swapAt(pivot, begin+counter)
    // 交换后， pivot左侧元素全小于pivot位置元素，右侧元素全大于pivot位置元素
    
    return begin+counter
}
