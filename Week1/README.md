
----
### 数组




- 基本性质：

连续的内存空间 & 相同类型;

支持随机访问，根据下标随机访问的时间复杂度为 O(1)

```
a[i]_address = base_address + (index * data_type_size)
```

- 常见题型：  
[两数之和](https://leetcode-cn.com/problems/two-sum/)  
[盛最多水的容器](https://leetcode-cn.com/problems/container-with-most-water/)  
[移动零](https://leetcode-cn.com/problems/move-zeroes/)  
[爬楼梯](https://leetcode.com/problems/climbing-stairs/)  
[三数之和](https://leetcode-cn.com/problems/3sum/)  
[删除排序数组中的重复项](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/)  
[旋转数组](https://leetcode-cn.com/problems/rotate-array/)  
[合并两个有序数组](https://leetcode-cn.com/problems/merge-sorted-array/)  
[加一](https://leetcode-cn.com/problems/plus-one/)


----
### 链表


- 分类: 
	
	单链表、循环链表、双向链表(用空间换时间)

	-注意边界:

		如果链表为空时;  
		如果链表只包含一个/两个结点时;  
		在处理头结点和尾结点的时候.  

- 缓存常用淘汰策略:

	- FIFO（First In，First Out）

	- 最少使用策略 LFU（Least Frequently Used, 淘汰一段时间内访问次数最少的对象）

 	- 最近最少使用策略 LRU（Least Recently Used, 淘汰最长时间未被使用的对象


- 常见题型：  
[反转链表](https://leetcode.com/problems/reverse-linked-list/)  
[两两交换链表中的节点](https://leetcode.com/problems/swap-nodes-in-pairs)  
[环形链表](https://leetcode.com/problems/linked-list-cycle)  
[环形链表 II](https://leetcode.com/problems/linked-list-cycle-ii)  
[K 个一组翻转链表](https://leetcode.com/problems/reverse-nodes-in-k-group/)  
[合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/)

---

####跳表 
	有序链表加多级索引的结构
	
思想：给数据升维，除了一维线性寻址，还增加了多级索引，可以利用索引的下指针，更快逼近目标节点

----
### 栈, 队列

- 栈: 先进后出（LIFO）的数据结构，常用数组来实现，注意“用栈实现队列”和“用队列实现栈”的编码练习

- 队列:
	- 顺序队列(数组实现)
	- 链式队列(链表实现)
	- 循环队列(解决数组内数组搬移效率问题)

	高级: 阻塞队列(入队、出队操作可以阻塞)、并发队列(线程安全)

	实践常用：优先队列(队列中的元素具有优先级属性，出队时高优先级的先出)，双端队列(队列两端都可以进出元素)


- 常见题型：  
[有效的括号](https://leetcode-cn.com/problems/valid-parentheses/)  
[最小栈](https://leetcode-cn.com/problems/min-stack/)  
[柱状图中最大的矩形](https://leetcode-cn.com/problems/largest-rectangle-in-histogram)  
[滑动窗口最大值](https://leetcode-cn.com/problems/sliding-window-maximum)  
[设计循环双端队列](https://leetcode.com/problems/design-circular-deque)  
[接雨水](https://leetcode.com/problems/trapping-rain-water/)
