
func selectionSort(_ array: inout [Int]) {
    
    guard array.count > 1 else { return }
    
    var minIdx = 0 // 每次内层遍历,找到的最小元素的索引
    
    for i in 0..<array.count-1 {
        minIdx = i
        for j in (i+1)..<array.count {
            if array[j] < array[minIdx] {
                minIdx = j
            }
        }
        if minIdx != i { array.swapAt(minIdx, i) } // minIdx修改了, 则将最小值换到i处
    }
}