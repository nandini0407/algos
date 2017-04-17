# Suppose you are managing the construction of billboards on the Stephen Daedalus Memorial Highway, a heavily traveled
# stretch of road that runs west-east for M miles. The possible sites for billboards are given by numbers xl, x2 ..... xn,
# each in the interval [0, M] (specifying their position along the highway, measured in miles from its western end).
# If you place a billboard at location xi, you receive a revenue of ri > 0.
# Regulations imposed by the county’s Highway Department require that no two of the billboards be within less than or equal
# to 5 miles of each other. You’d like to place billboards at a subset of the sites so as to maximize your total revenue,
# subject to this restriction.
# # {x1, x2, x3, x4} = {6, 7, 12, 14},
# and
# {rl, r2, r3, r4} = {5, 6, 5, 1}.
#
# Solution :
# The optimal output of this problem is 10 (r1 + r3), the sum of revenues of x1 and x3. Before computing the optimal solution, we
# need to compute nearest_left(j) which is the nearest site more than 5 miles to the left of any given site xj. The optimal solution
# for any location xj (j between 1 and n), will either a) include xj or b) does not include xj. The maximum of these two will be the
# optimal solution for xj. If it includes xj, then F(j) = rj + F(nearest_left(j)). If it does not include xj, then the solution is
# F(j) = F(j - 1).
# Base case :
# x0 = r0 = 0
# Use an array to store the optimal solutions at each site.
# Bottom-up logic : arr[j] = max((rj + arr[nearest_left(j)]), arr[j - 1])

def billboards(sites, revenues)
  sites.unshift(0)
  nearest_left = compute_nearest_left(sites)
  revenues.unshift(0)
  optimal_revenues = [0] # one-dimensional
  j = 1
  while j < sites.length
    val = [(revenues[j] + optimal_revenues[nearest_left[j]]), optimal_revenues[j - 1]].max
    optimal_revenues << val
    j += 1
  end
  optimal_revenues.max
end

def compute_nearest_left(sites)
  # sites array is already sorted here
  nearest_left = []
  i = sites.length - 1
  while i >= 0
    j = i - 1
    found = false
    until found || j < 0
      if (sites[i] - sites[j]) > 5
        nearest_left.unshift(j)
        found = true
      else
        j -= 1
      end
    end
    nearest_left.unshift(0) if found == false
    i -= 1
  end
  nearest_left
end

puts billboards([6, 7, 12, 14], [5, 6, 5, 1])
puts billboards([6], [5])
