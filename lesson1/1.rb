# frozen_string_literal: true

puts 'Введите имя'
name = gets.chomp

puts 'Введите рост'
height = gets.chomp

weight = (height.to_f - 110) * 1.15

if weight < 0
  puts 'Ваш вес уже оптимальный'
else
  puts "Привет #{name}! Твой идеальный вес - #{weight}"
end
