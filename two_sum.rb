=begin

Leetcode 1. Two Sum
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]
 

Constraints:

2 <= nums.length <= 104
-109 <= nums[i] <= 109
-109 <= target <= 109
Only one valid answer exists.

PSEUDOCODE:
Sort the array and use two pointers, one starting at the beginning and one starting
at the end of the array.
Loop until left pointer == right pointer
  If the sum of the two numbers pointed to equal the target, return the
  two pointer values.
  If the sum of the two numbers pointed to is greater than the target, the answer
    cannot involve the max pointer, as the combination of it and any other number
    besides the left pointer would be yet greater.
    So decrement the right pointer.
  If the sum of the two numbers pointed to is less than the target, the answer
  cannot involve the min pointer, since the sum of it and any other number besides
  the max pointer would be even less.
    So increment the left pointer
End loop
We shouldn't get here, as the specification guarantees exactly one solution

=end

