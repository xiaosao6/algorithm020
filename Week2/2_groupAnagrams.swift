
class Solution {
	
	func groupAnagrams(_ strs: [String]) -> [[String]] {
    
	    var hashTable = [String: [String]]() // key: encodedString, value: origin strings

	    for str in strs {
	        
	        var array = [Int](repeating: 0, count: 26)
	        
	        for char in str {
	            let offset = Int(char.asciiValue! - Character("a").asciiValue!)
	            array[offset] += 1
	        }
	        
	        var key = ""
	        for i in 0..<26 { key.append("\(array[i])_") }
	        
	        // key, example: "1_0_0_0_1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_1_0_0_0_0_0_0_"
	        
	        if var array = hashTable[key] {
	            array.append(str)
	            hashTable[key] = array
	        } else {
	            hashTable[key] = [str]
	        }
	    }
	    
	    var result = [[String]]()
	    
	    hashTable.values.forEach {
	        result.append($0)
	    }
	    
	    return result
}
	
}
