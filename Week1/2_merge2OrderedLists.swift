class Solution {

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        if l1 == nil { return l2 }
        if l2 == nil { return l1 }

        var node1 = l1
        var node2 = l2

        if let value1 = node1?.val, let value2 = node2?.val, value1 < value2 {
            node1?.next = mergeTwoLists(node1?.next, node2)
            return node1
        } else {
            node2?.next = mergeTwoLists(node1, node2?.next)
            return node2
        }
    }
}