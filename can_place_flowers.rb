# Leetcode 605. Can Place Flowers
# -
# You have a long flowerbed in which some of the plots are planted,
# and some are not. However, flowers cannot be planted in adjacent plots.
# -
# Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty,
# and an integer n, return true if n new flowers can be planted in the flowerbed
# without violating the no-adjacent-flowers rule and false otherwise.

# Strategy:
# The general case is that a stretch of 3 empty plots allows one flower, with an additional flower
# for every additional 2 empty plots in that same stretch.
#
# Keep a counter of empty adjacent plots.  When we reach the end of a local stretch of adjacent plots,
# compute how many flowers can fit and reset the counter to zero.
#
# The beginning and end of the array are special cases, since a stretch of 2 empty
# plots at the beginning or at the end will allow for a flower (hence initializing local_run to 1 at the beginning, and omitting the
# "- 1" at the end for the integer division computation).
#
# The end of the array is also a special case since we've exited the loop but still
# may need to compute if any flowers fit into the end.

def can_place_flowers(flowerbed, n)
    total_possible_plots = 0
    local_run_of_empty_plots = 1
    flowerbed.each do | flower_present |
        if flower_present == 1
            total_possible_plots += (local_run_of_empty_plots - 1) / 2 if local_run_of_empty_plots >= 3
            local_run_of_empty_plots = 0    
        else
            local_run_of_empty_plots += 1
        end
    end
    total_possible_plots += local_run_of_empty_plots / 2 if local_run_of_empty_plots >= 2
    return total_possible_plots >= n
end