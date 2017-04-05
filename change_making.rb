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
