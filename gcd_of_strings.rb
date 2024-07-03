# Leetcode 1071. Greatest Common Divisor of Strings
# For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t
# (i.e., t is concatenated with itself one or more times).
# Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

def gcd_of_strings(str1, str2)

    candidate_gcd_length = str2.length

    while candidate_gcd_length > 0
        if (str1.length % candidate_gcd_length == 0 && str2.length % candidate_gcd_length == 0)
            candidate_gcd = str2[0,candidate_gcd_length]
            return candidate_gcd if (str1.gsub(candidate_gcd,"")).length == 0 && (str2.gsub(candidate_gcd,"")).length == 0
        end
        candidate_gcd_length -= 1
    end

    return ""
end