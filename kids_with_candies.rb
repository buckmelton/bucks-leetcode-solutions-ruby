# Leetcode 1431. Kids With the Greatest Number of Candies
# There are n kids with candies. You are given an integer array candies,
# where each candies[i] represents the number of candies the ith kid has,
# and an integer extraCandies, denoting the number of extra candies that you have.
# -
# Return a boolean array result of length n, where result[i] is true if, after giving
# the ith kid all the extraCandies, they will have the greatest number of candies among all the kids, or false otherwise.
# -
# Note that multiple kids can have the greatest number of candies.

def kids_with_candies(candies, extra_candies)
    candies.map do |amt_candies_for_this_kid|
        amt_candies_for_this_kid += extra_candies
        amt_candies_for_this_kid >= candies.max
    end
end