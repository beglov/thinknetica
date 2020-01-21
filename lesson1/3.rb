puts "Введите три стороны треугольника"

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

if a == b && b == c
  puts "Треугольник равносторонний"
end

if a == b || b == c || c == a
  puts "Треугольник равнобедренный"
end

arr = [a, b, c]
max = arr.max
if max ** 2 == arr.reject { |i| i == max }.sum { |i| i ** 2 }
  puts "Треугольник прямоугольный"
end
