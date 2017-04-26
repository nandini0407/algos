## Master Theorem

The general divide-and_conquer recurrence is :

T(n) = aT(n/b) + f(n),

where f(n) is a function that accounts for the time spent on dividing an instance of size n into instances of size n/b and combining their solutions.

The order of growth of T(n) depends on the values of the constants a and b, and the order of growth of the function f(n). The efficiency analysis of many divide-and_conquer algorithms is greatly simplified by the following theorem.

The Master Theorem goes like so :
If f(n) belongs to O(n^d) where d >= 0 in the above recurrence, then

T(n) belongs to :
- O(n^d) if a < b^d
- O(n^d log n) if a = b^d
- O(n^(log<sub>b</sub> a)) if a > b^d
