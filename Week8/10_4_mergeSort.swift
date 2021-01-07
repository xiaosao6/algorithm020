
func mergeSort(_ array: inout [Int]) {
    
    guard array.count > 1 else { return }
    
    __mergeSort(&array, left: 0, right: array.count-1)
}

private func __mergeSort(_ array: inout [Int], left: Int, right: Int) {
    
    guard left < right else { return }
    
    let mid = left + ((right - left) >> 1)
    
    // 分治, 每次一分为二
    __mergeSort(&array, left: left, right: mid)
    __mergeSort(&array, left: mid+1, right: right)
    // 合并
    __merge(&array, left: left, mid: mid, right: right)
}

private func __merge(_ array: inout [Int], left: Int, mid: Int, right: Int) {
    
    var temp = [Int](repeating: 0, count: right - left + 1) // 中间数组
    var i = left
    var j = mid + 1
    var k = 0
    
    while i <= mid, j <= right {
        temp[k] = min(array[i], array[j])
        if array[i] <= array[j] {
            i += 1
        } else {
            j += 1
        }
        k += 1
    }
    
    while i <= mid {
        temp[k] = array[i]
        k += 1; i += 1
    }
    
    while j <= right {
        temp[k] = array[j]
        k += 1; j += 1
    }
    
    for l in 0..<temp.count {
        array[left + l] = temp[l]
    }
}
