# Leetcode 345. Reverse Vowels of a String
# -
# Given a string s, reverse only all the vowels in the string and return it.
# -
# The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

def reverse_vowels(s)
    # Create result string as copy of input string s
    # Use two pointers into string s, ptr1 and ptr2
    # ptr1 starts at index 0 of string, ptr2 starts at last index of string
    # As long as ptr1 is less than ptr2
    #   As long as ptr1 doesn't point to a vowel and is less than ptr2
    #     increment ptr1 by one
    #   As long as ptr2 doesn't point to a vowel and is greater than ptr1
    #     decrement ptr1
    #   Assert: either ptr1 == ptr2
    #             in which case exit loop and return result string
    #           or ptr1 and ptr2 both point to a vowel
    #             in which case swap the vowels, increment ptr1, and decrement ptr2
    # return result string

    result = String.new(s)
    ptr1 = 0
    ptr2 = s.length - 1
    while ptr1 < ptr2 do
        while (!VOWELS.include?(s[ptr1])) && (ptr1 < ptr2) do
            ptr1 += 1
        end
        while (!VOWELS.include?(s[ptr2])) && (ptr1 < ptr2) do
            ptr2 -= 1
        end
        break if ptr1 == ptr2
        result[ptr1] = s[ptr2]
        result[ptr2] = s[ptr1]
        ptr1 += 1
        ptr2 -= 1
    end
    result
end