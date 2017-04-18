# Give change for amount n using the minimum number of coins of denominations d1 < d2 < . . . < dm.
# Solution :
# Let F(n) be the minimum number of coins whose values add up to n. The amount n can be obtained by adding one coin of
# denomination dj to the amount (n - dj), such that n >= dj. Calculate F(n - dj) for all denominations and choose the minimum.
# Add one to this since adding one coin of dj results in a total of amount n.
# Top-down recursion can be expressed as :
# F(n) = 1 + min(F(n - dj)) such that n >= dj
# Base case :
# F(0) = 0
# Bottom-up logic :
# number_of_coins[n] = 1 + min(number_of_coins[n - dj]) for all j such that n >= dj

def make_change(deno, change)
  f = [0]
  deno.unshift(0)
  i = 1
  while i <= change
    temp = Float:: INFINITY
    j = 1
    while j < deno.length && i >= deno[j]
      temp = [f[i - deno[j]], temp].min
      j += 1
    end
    f << (temp + 1)
    i += 1
  end
  f[change]
end

puts make_change([1, 3, 4], 6)
puts make_change([1, 7, 10], 14)
