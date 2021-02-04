----

### 哈希表

2个核心问题: `散列函数设计`和`散列冲突解决`

**原理**: 散列表用的就是数组支持按照下标随机访问的时候，时间复杂度是 O(1) 的特性。我们通过散列函数把元素的键值映射为下标，然后将数据存储在数组中对应下标的位置

散列冲突的常用解决方式:

- 开放寻址法（open addressing）
    当我们往散列表中插入数据时，如果某个数据经过散列函数散列之后，存储位置已经被占用了，我们就从当前位置开始，依次往后查找，看是否有空闲位置，直到找到为止。
    注意,删除元素时, 我们可以将删除的元素，特殊标记为 deleted。当线性探测查找的时候，遇到标记为 deleted 的空间，并不是停下来，而是继续往下探测

    对于开放寻址冲突解决方法，除了线性探测方法之外，还有另外两种比较经典的探测方法，二次探测（Quadratic probing）和双重散列（Double hashing）

- 链表法（chaining）
    当插入的时候，我们只需要通过散列函数计算出对应的散列槽位，将其插入到对应链表中即可，所以插入的时间复杂度是 O(1)。当查找、删除一个元素时，我们同样通过散列函数计算出对应的槽，然后遍历链表查找或者删除

散列冲突解决方式如何选择: 

- 当数据量比较小、装载因子小的时候，适合采用开放寻址法; 
- 基于链表的散列冲突处理方法比较适合存储大对象、大数据量的散列表，而且，比起开放寻址法，它更加灵活，支持更多的优化策略，比如用红黑树代替链表.

生成散列函数要点: 时间消耗要小, 生成的值要尽可能随机且均匀分布

扩容优化:将扩容操作均摊到插入操作中

**常考题型：**

[有效的字母异位词](https://leetcode-cn.com/problems/valid-anagram/description/)  
[两数之和](https://leetcode-cn.com/problems/two-sum/description/)  
[字母异位词分组](https://leetcode-cn.com/problems/group-anagrams/)

----

### 二叉树、二叉搜索树

#### 二叉树分类：


`二叉树(Binary Tree)`: 每个节点最多有两个“叉”，也就是两个子节点，分别是左子节点和右子节点

`满二叉树`: 除了叶子节点之外，每个节点都有左右两个子节点. (“全部满了")

`完全二叉树`: 叶子节点都在最底下两层，最后一层的叶子节点都靠左排列，并且除了最后一层，其他层的节点个数都要达到最大.(如下图), 使用数组存储时, 节点 X 存储在数组中下标为 i 的位置，下标为 2 * i 的位置存储的就是左子节点，下标为 2 * i + 1 的位置存储的就是右子节点

#### 二叉树遍历方式：

前序: 根\左\右  
中序: 左\根\右  
后序: 左\右\根  
按层遍历


#### 二叉查找树（Binary Search Tree）

中序遍历二叉查找树，可以输出有序的数据序列，时间复杂度是 O(n)，非常高效

**常考题型：**

（树的面试题解法一般都是递归）

二叉树的 前序/中序/后序/层序遍历  
N叉树的 前序/中序/后序/层序遍历

需要反复熟练的两种代码写法： `递归`、 `迭代`  
迭代写法的前序最容易理解(根左右), 其次是中序遍历(左根右), 最难的是后序遍历(左右根)

示例：  
[二叉树的中序遍历](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)  
[二叉树的前序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/)  
[N 叉树的后序遍历](https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/)  
[N 叉树的前序遍历](https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/description/)  
[N 叉树的层序遍历](https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/)  

----

### 二叉堆

* 堆是一个完全二叉树；
* 堆中每一个节点的值都必须大于等于（或小于等于）其子树中每个节点的值。

PS: 根节点最大的叫大顶堆, 根节点最小的叫小顶堆.


**堆的应用**:

- 优先队列: 1. 合并有序小文件,  2. 高性能定时器
- 利用堆求 Top K  
- 利用堆求中位数  

**常考题型：**

[topK 问题](https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/)  
[滑动窗口最大值](https://leetcode-cn.com/problems/sliding-window-maximum/)  
[丑数](https://leetcode-cn.com/problems/chou-shu-lcof/)  
[前 K 个高频元素](https://leetcode-cn.com/problems/top-k-frequent-elements/)  

----

### 图


- 图中的元素: 顶点(vertex)

- 顶点之间的连线: 边(edge)

- 顶点的度（degree），就是跟顶点相连接的边的条数。顶点的入度，表示有多少条边指向这个顶点；顶点的出度，表示有多少条边是以这个顶点为起点指向其他顶点

带权图（weighted graph）。在带权图中，每条边都有一个权重（weight）


图的存储方法:

- 邻接矩阵存储方法: 简单、直接, 方便计算, 比较浪费存储空间

- 邻接表存储方法: 比较节省空间，但是使用起来就比较耗时间
