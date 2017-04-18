def fibo(n)
  fibs = []
  fibs[0] = 0
  fibs[1] = 1
  i = 2
  while i < n
    fibs[i] = fibs[i - 1] + fibs[i - 2]
    i += 1
  end

  fibs[n - 1]
end

puts fibo(5)
