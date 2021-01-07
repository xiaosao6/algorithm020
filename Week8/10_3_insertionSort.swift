
func insertionSort(_ array: inout [Int]) {
    
    guard array.count > 1 else { return }
    
    var j: Int
    
    for i in 1..<array.count {
        j = i
        while j > 0, array[j-1] > array[j] {
            array.swapAt(j-1, j)
            j -= 1
        }
    }
}
