class Solution {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var hashTable = [Int: Int]() // key: 数值， value: 索引

        for i in 0..<nums.count {

            let theOther = target - nums[i]

            if let j = hashTable[theOther] {

                return [j, i]

            } else {

                hashTable[nums[i]] = i
            }

        }

        return []
    }

}