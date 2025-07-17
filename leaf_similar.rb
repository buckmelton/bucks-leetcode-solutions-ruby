# Leetcode 872. Leaf-Similar Trees
# Consider all the leaves of a binary tree, from left to right order, the values of those leaves form a leaf value sequence.
# For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).

# Two binary trees are considered leaf-similar if their leaf value sequence is the same.

# Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.

# Example 1:
# Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
# Output: true

# Example 2:
# Input: root1 = [1,2,3], root2 = [1,3,2]
# Output: false
 
# Constraints:
# The number of nodes in each tree will be in the range [1, 200].
# Both of the given trees will have values in the range [0, 200].

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