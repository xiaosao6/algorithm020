
func bubbleSort(_ array: inout [Int]) {
    
    guard array.count > 1 else { return }
    
    var isOrdered: Bool
    
    for i in 0..<array.count-1 {
        isOrdered = true
        for j in 0..<(array.count-1-i) { // 每次内层循环结束, 可以保证末尾i+1个元素是有序的
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
                isOrdered = false
            }
        }
        if isOrdered { break } // 本次内层循环已经是有序的, 提前结束
    }
}
