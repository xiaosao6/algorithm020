class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        
        if s.isEmpty { return 0 }

        let sizes = s.sorted() // 从小到大排列的“尺寸”数组
        let children = g.sorted() // 从小到大排列的“胃口”数组

        // 从末尾开始遍历
        var foodIndex = sizes.count - 1 
        var childIndex = children.count - 1
        var feedOKCount = 0

        while childIndex >= 0 {

            if foodIndex >= 0, sizes[foodIndex] >= children[childIndex] { // 喂饱了一个
                feedOKCount += 1
                foodIndex -= 1
            }

            childIndex -= 1
        }
        
        return feedOKCount
    }
}