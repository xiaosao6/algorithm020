
----
### 位运算

按位取反(每一个二进制位0变1, 1变0)：~

异或(二进制位相同为0, 不同为1)：^


- 常用性质：

```Swift
x^0 => x

x^x => 0

x^全1 => ~x

x^(~x) => 全1

x&(~x) => 全0

交换a和b两个数:
a = a^b
b = b^a
a = a^b

判断奇偶:
x & 1 == 1 说明是奇数
x & 1 == 0 说明是偶数

除以2:
x = x >> 1 等价于 x = x / 2

```
- N皇后中两个位运算的理解:  

```Swift
bits & -bits   最后一位 1 保留，其它位全部为 0
理解：
计算机存储数的时候存储的是补码，正数的补码是其本身，而负数的补码是其反码加1.因此，00110110加一个负号以后就变成了10110110（姑且认为最高位是符号位），其反码为11001001，补码为11001010。这个跟原来的数按位与后就是00000010


bits & (bits - 1)   清除最低位的1
自己随便画个例子就能明白
```


- 常见题型：  
[位 1 的个数](https://leetcode-cn.com/problems/number-of-1-bits/)  
[2 的幂](https://leetcode-cn.com/problems/power-of-two/)  
[颠倒二进制位](https://leetcode-cn.com/problems/reverse-bits/)  
[N 皇后](https://leetcode-cn.com/problems/n-queens/description/)  
[N 皇后 II ](https://leetcode-cn.com/problems/n-queens-ii/description/)  
[比特位计数](https://leetcode-cn.com/problems/counting-bits/description/)  


----
### Bloom filter

- 优点:
可以以很低的时间空间复杂度检索一个元素是否在一个集合中, 判断不在集合中是准确的.

- 缺点:
判断在集合中可能误判(只是有在的可能); 删除元素困难

- 原理:
将元素通过随机映射函数计算得到若干个二进制位的标识, 将数组中对应索引进行标记


----
### LRU cache

- 特点：查询时间 O(1), 更新时间 O(1)

- 常见淘汰策略:

 - LFU: (依据是使用频率),如果一个数据在最近一段时间内使用次数很少，那么在将来一段时间内被使用的可能性也很小，所以优先淘汰

 - LRU: (依据是使用时间),当缓存（页）满时，优先移除最近最久未使用的数据


- LRU Cache的实现要点(读写的时间复杂度要为O(1)):  
 
	双向链表 + 哈希表 (因为哈希表查找快但是无序, 双向链表有顺序但是查找慢, 因此将两者结合互补, 因为删除操作是O(1)的, 所以要用双向链表才能支持查找前驱节点)

- 实现代码见: 6_LRUCache.swift
		
- 常见题型：    
[LRU 缓存机制](https://leetcode-cn.com/problems/lru-cache/#/)


----
### Sorting


最需要掌握的，O(n logn)：

    堆排序   (10_6_heapSort.swift)
    快速排序 (10_5_quickSort.swift)
    归并排序 (10_4_mergeSort.swift)

基础的，O(n²)：

    选择  (10_1_selectionSort.swift)
    插入  (10_3_insertionSort.swift)
    希尔(插入的优化版)
    冒泡  (10_2_bubbleSort.swift)

- 其它的排序方式(了解即可):

	- 计数排序: (https://sort.hust.cc/8.countingsort)  
将输入的数据值转化为键存储在额外开辟的数组空间中。作为一种线性时间复杂度的排序，计数排序要求输入的数据必须是有确定范围的整数

	- 桶排序: (https://www.runoob.com/w3cnote/bucket-sort.html)  
计数排序的升级版。它利用了函数的映射关系，高效与否的关键就在于这个映射函数的确定

	- 基数排序: (https://sort.hust.cc/10.radixsort)  
将整数按位数切割成不同的数字，然后按每个位数分别比较

- 常见题型：  
[数组的相对排序](https://leetcode-cn.com/problems/relative-sort-array/)  
[有效的字母异位词](https://leetcode-cn.com/problems/valid-anagram/)  
[合并区间](https://leetcode-cn.com/problems/merge-intervals/)  
[翻转对](https://leetcode-cn.com/problems/reverse-pairs/)  

