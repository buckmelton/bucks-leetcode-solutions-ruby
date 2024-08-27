# LeetCode 392. Is Subsequence
# Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

# A subsequence of a string is a new string that is formed from the original string by
# deleting some (can be none) of the characters without disturbing the relative positions of the
# remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).


# Example 1:

# Input: s = "abc", t = "ahbgdc"
# Output: true
# Example 2:

# Input: s = "axc", t = "ahbgdc"
# Output: false
 

# Constraints:

# 0 <= s.length <= 100
# 0 <= t.length <= 104
# s and t consist only of lowercase English letters.

=begin
MY NOTES:

This is specified as a two-pointer problem.

Note that, in the case where we DO find that s is a subsequence of t, we don't have to remember/return the positions of the letters of s in t.

First thought: s_ptr points to the letter in s that we are currently seeking in t. t_ptr points to the position in t
of the farthest / most recent letter we've successfully found from the substring.

But then I thought, we may need to backtrack more than just the most recently successfully discovered.
For instance if s = 'abcded' and t = 'abcabcdabcdeabcdbdcedcef', we'll often need to backtrack past occurences of finding e, d etc before finding f.

But then I realized that's BS, I was right the first time, we do literally only need to keep track of the last letter successfully found.

PSEUDOCODE:
initialize s_ptr to first letter in s
initialize t_ptr to first letter in t
while s_ptr < s.length
  while t[t_ptr] != s[s_ptr] && t_ptr < t.length
    increment t_ptr
  if t_ptr >= t.length
    Assert: we've looked through the entire t
    return false
  assert: we have found s[s_ptr] in t
  if s_ptr == s.length-1
    Assert: we've found the last letter
    return true
  set t_ptr (now pointing to the farthest s letter we've found) to the next letter in t, i.e. increment t_ptr
  increment s_ptr, since we've just found the s letter we were looking for, we need to go on and look for the next one
I *think* we are guaranteed to have returned by now
Assert: we should never get here
=end

def is_subsequence(s, t)
  s_ptr = t_ptr = 0
  while s_ptr < s.length do
    while ((t[t_ptr] != s[s_ptr]) && t_ptr < t.length) do
      t_ptr += 1
    end
    return false if t_ptr >= t.length
    return true if s_ptr == s.length - 1
    t_ptr += 1
    s_ptr += 1
  end
  p "We should never get here"
end