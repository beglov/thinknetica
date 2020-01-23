arr = [1, 1]

while (last = arr[-1] + arr[-2]) < 100
  arr << last
end

puts arr
