# frozen_string_literal: true

puts 'Введите три коэффициента'

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

d = b**2 - 4 * a * c

puts "Дескрименант равен #{d}"

if d < 0
  puts 'Корней нет'
elsif d == 0
  x = -b / (2 * a)
  puts "Есть один корень #{x}"
else
  sqrt = Math.sqrt(d)
  x1 = (-b + sqrt) / (2 * a)
  x2 = (-b - sqrt) / (2 * a)
  puts "Есть два корня #{x1} и #{x2}"
end
