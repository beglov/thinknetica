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

a, b, c = [a, b, c].sort

if c ** 2 == a ** 2 + b ** 2
  puts "Треугольник прямоугольный"
end
