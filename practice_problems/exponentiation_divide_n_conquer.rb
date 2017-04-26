# Write a divide_and_conquer algorithm for the exponentiation problem of
# computing (a ** n) where n is a positive integer.
#
# Solution : Use recursion in two ways. If the power is even, then
# (a ** (n/2)) * (a ** (n/2)) = (a ** n). If the power is odd, then
# (a ** (n - 1)) * a = (a ** n). Base cases are when power is 0 or 1. 

def expo(a, n)
  if n == 0
    return 1
  elsif n == 1
    return a
  elsif n % 2 == 0
    return (expo(a, n / 2) * expo(a, n / 2))
  else
    return a * expo(a, (n - 1))
  end
end

p expo(2, 5) # 32
p expo(2, 3) # 8
p expo(2, 4) # 16
p expo(2, 1) # 2
p expo(2, 0) # 1
p expo(3, 3) # 27
