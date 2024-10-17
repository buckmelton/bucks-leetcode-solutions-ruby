# LeetCode 643. Maximum Average Subarray I
#
# You are given an integer array nums consisting of n elements, and an integer k.
#
# Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10**(-5) will be accepted.
#
# Example 1:
#
# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
# Example 2:
#
# Input: nums = [5], k = 1
# Output: 5.00000
#
# Constraints:
#
# n == nums.length
# 1 <= k <= n <= 105
# -104 <= nums[i] <= 104


=begin

MY OBSERVATIONS/NOTES:
This is specified as a sliding window problem.
We start with a window of size k positioned at the start of the array, with two pointers pointing
to the start and end of the window.  We calculate the average of the integers in the window by
summing them (saving the sum) and dividing by k.  This first average becomes the max.  We move
the window by one, updating the sum by adding the next element in the array and subtracting the
first element of the window, and calculate the average again 

PSEUDOCODE:
Initialize window pointer to 0
Initialize max average to 0
Initialize sum to sum of all elements in window
Initialize max average to average of sum
While window can still be moved to the right
  Increment window pointer
  Set new sum to sum of all elements within window
  Calculate average
  If new average greater than max average
    Replace max average
End while  

=end

def find_max_average(nums, k)
  window_left = 0
  max_sum = sum = nums[window_left..window_left + k - 1].reduce(:+)
  max_avg = sum.fdiv(k)
  while window_left < nums.size - k do
    window_left += 1
    sum = sum - nums[window_left - 1] + nums[window_left + k -1]
    max_avg = sum.fdiv(k) if sum > max_sum
  end
  return max_avg
end
