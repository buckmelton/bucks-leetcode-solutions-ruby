# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def leaf_similar(root1, root2)
  def leaf_seq(root)
    res = []

    def leaf_seq_helper(root, res)
      if !root.left && !root.right
        res.push(root.val)
      else
        leaf_seq_helper(root.left, res) if root.left
        leaf_seq_helper(root.right, res) if root.right
      end
    end

    leaf_seq_helper(root, res)
    return res
  end

  seq1 = leaf_seq(root1)
  seq2 = leaf_seq(root2)

  return seq1.eql?(seq2)
end

=begin

Complexity:

Time: O(N) + O(M) where N = number of nodes and M = number of leaves.
We are traversing each of the N nodes, once => O(N) and then we are comparing each leaf => O(M).

Space: O(M) + O(log N).
We are creating 2 O(M) arrays => O(M), and we are creating log N entries on the recursive call stack => O(log N).

=end