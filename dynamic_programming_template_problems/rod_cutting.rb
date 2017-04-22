# Given a rod of length n inches and a table of prices pi, i=1,2,…,n, write an algo­rithm to find the max­i­mum rev­enue rn
# obtain­able by cut­ting up the rod and sell­ing the pieces.
# For rod of length: 4, prices = [0, 1, 5, 8, 9] (prices correspond to lengths 0 through 4 inches)
# Ways to sell :
# •	selling length : 4  ( no cuts) , Price: 9
# •	selling length : 1,1,1,1  ( 3 cuts) , Price: 4
# •	selling length : 1,1,2  ( 2 cuts) , Price: 7
# •	selling length : 2,2  ( 1 cut) , Price: 10
# •	selling length : 3, 1  ( 1 cut) , Price: 9
# Best Price for rod of length 4: 10
#
# Solution : Let F(i) be the best price for a rod of length i. It is calculated by comparing the maximum of
# (F(i - 1) + price[1]), (F(i - 2) + price[2]), (F(i - 3) + price[3]),..., (F(1) + price[i - 1]), F(0) + price[i].
# Base case :
# F(0) = 0
# F(1) = price[1]
# Bottom-up logic :
# arr[i] = max(arr[i - j] + price[j]) where j = 1 to i

def rod_cut(n, prices)
  opt_price = []
  prices.unshift(0) # assuming prices start from the length = 1
  opt_price[0] = 0
  opt_price[1] = prices[1]

  i = 2
  while i <= n
    j = 1
    temp = 0
    while j <= i
      temp = [(opt_price[i - j] + prices[j]), temp].max
      j += 1
    end
    opt_price << temp
    i += 1
  end

  opt_price.max
end

puts rod_cut(4, [1, 5, 8, 9])
