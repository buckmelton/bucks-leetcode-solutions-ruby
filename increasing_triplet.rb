# LeetCode 334. Increasing Triplet Subsequence
 
# Given an integer array nums, return true if there exists a triple of indices (i, j, k)
# such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.

# This was a very non-intuitive solution.  After many attempts at more intuitive solutions
# (including, when checking the next candidate, skipping values that are <= the current value --
# since we've just established the current value wasn't larger than the previous value, it
# stands to reason anything equal or smaller wouldn't be larger either).  Many of my solutions
# were correct, but when values were large, exceeded the time limit.  I finally broke
# down and read the Editorial, which describs the solution below.  Many commenters on this
# solution noted that it is mind-blowing and that it's VERY unlikely any interviewee would
# be able to come up with this solution in an interview setting.  So I don't feel so bad.

# I won't reproduce the explanation here.  See LeetCode 334 for Editorial.

INTEGER_MAX = (2**31) - 1
def increasing_triplet(nums)
  first_num = INTEGER_MAX
  second_num = INTEGER_MAX
  for num in nums
    if num <= first_num
      first_num = num
    elsif num <= second_num
      second_num = num
    else
      return true
    end
  end
  return false
end