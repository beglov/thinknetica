# frozen_string_literal: true

puts 'Введите три стороны треугольника'

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

puts 'Треугольник равносторонний' if a == b && b == c

puts 'Треугольник равнобедренный' if a == b || b == c || c == a

a, b, c = [a, b, c].sort

puts 'Треугольник прямоугольный' if c**2 == a**2 + b**2
