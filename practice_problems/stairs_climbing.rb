# A child is climb­ing up a stair­case with n steps, and can hop either 1 step, 2 steps, or 3 steps at a time.
# Imple­ment a method to count how many pos­si­ble ways the child can jump up the stairs.
#
#
#
# Solution : Use dynamic programming.

def stairs_climbing_ways(n)
  number_of_ways = []
  number_of_ways[0] = 0
  number_of_ways[1] = 1
  number_of_ways[2] = 2
  number_of_ways[3] = 4
  i = 4
  while i <= n
    number_of_ways[i] = number_of_ways[i - 1] + number_of_ways[i - 2] + number_of_ways[i - 3] + 1
    i += 1
  end
  number_of_ways[n]
end

puts stairs_climbing_ways(4)
