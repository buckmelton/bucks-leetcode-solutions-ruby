=begin
Leetcode 2390. Removing Stars From a String
You are given a string s, which contains stars *.

In one operation, you can:

Choose a star in s.
Remove the closest non-star character to its left, as well as remove the star itself.
Return the string after all stars have been removed.

Note:

The input will be generated such that the operation is always possible.
It can be shown that the resulting string will always be unique.
 

Example 1:

Input: s = "leet**cod*e"
Output: "lecoe"
Explanation: Performing the removals from left to right:
- The closest character to the 1st star is 't' in "leet**cod*e". s becomes "lee*cod*e".
- The closest character to the 2nd star is 'e' in "lee*cod*e". s becomes "lecod*e".
- The closest character to the 3rd star is 'd' in "lecod*e". s becomes "lecoe".
There are no more stars, so we return "lecoe".
Example 2:

Input: s = "erase*****"
Output: ""
Explanation: The entire string is removed, so we return an empty string.
 

Constraints:

1 <= s.length <= 105
s consists of lowercase English letters and stars *.

=begin
OBSERVATIONS:
This is specfied as a stack problem.

GENERAL IDEA:
If no star ever has another
star to its left, we would just be able to go through and delete every star / non-star pair.
The issue is that we may have multiple stars in a row.  We can use a stack to keep track of
how many stars we've encountered that didn't have a matching non-star to its left.  Then,
when we encounter a non-star, we can pop a star off the stack if there is one and delete the
star / non-star pair.  If there is no star on the stack, we leave the non-star character in
place and keep moving left.

PSEUDOCODE:
Start from the last character of the string.
Loop as follows:
  If the current character is not a star
    Check the stack for a star
    If there is a star on the stack
      Pop the star off the stack and toss it, and delete the current non-star character, move index one to left
    Else
      move index one to left
  Else (cur char in string is a star)
    If the next char to the left is a star, or there is no char to the left (we're at the beginning of the string)
      Delete the cur star from the string and push it onto the stack
      Move index one to left
    else (next char to left isn't a star)
      Delete cur star and the char to the left of it
      Move index 2 to left
Return string

=end

def remove_stars(s)
  cur_char_index = s.length - 1
  stack = []
  while cur_char_index >= 0 do
    if s[cur_char_index] != '*' then
      if stack[stack.length-1] == '*' then
        stack.pop
        s.slice!(cur_char_index,1)
        cur_char_index -= 1
      else
        cur_char_index -= 1
      end
    else # cur_char_index points to '*'
      if (s[cur_char_index-1] == '*') || (cur_char_index == 0)
        s.slice!(cur_char_index,1)
        stack.push('*')
        cur_char_index -= 1
      else # cur char is '*' and next char to left is NOT '*'
        s.slice!(cur_char_index-1,2)
        cur_char_index -= 2
      end
    end
  end
  return s
end