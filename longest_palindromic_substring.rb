# Given a string, find the length of the longest substring which is palindrome. For example, if the given string is “forgeeksskeegfor”,
# the output should be 10 (for “geeksskeeg”).
#
#
#
# Solution : Use Dynamic Programming.

def longest_palin_substring(str)
  longest_palins = [1]

  if str[1] == str[0]
    longest_palins << 2
  else
    longest_palins << 1
  end

  j = 2
  while j < str.length
    if str[j] == str[j - 1] && longest_palins[j - 1] == 1
      longest_palins << 2
    elsif str[j] == str[j - (longest_palins[j - 1] + 1)]
      longest_palins << (longest_palins[j - 1] + 2)
    else
      longest_palins << 1
    end

    j += 1
  end

  longest_palins.max
end

puts longest_palin_substring("forgeeksskeegfor")
puts longest_palin_substring("dcabace")
puts longest_palin_substring("dabbac")
puts longest_palin_substring("dabbacabace")
