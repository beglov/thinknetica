# frozen_string_literal: true

products = {}

loop do
  puts 'Введите название товара или "стоп" для окончания ввода'
  name = gets.chomp
  break if name == 'стоп'

  puts 'Введите цену за единицу'
  price = gets.chomp.to_f

  puts 'Введите кол-во купленного товара'
  cnt = gets.chomp.to_f

  products[name] = { price: price, cnt: cnt }
end

total_sum = 0
products.each do |product_name, product_data|
  sum = product_data[:price] * product_data[:cnt]
  total_sum += sum

  puts "Товар: #{product_name}, цена за единицу: #{product_data[:price]}, кол-во: #{product_data[:cnt]}, итого: #{sum}"
end

puts "Итоговая сумма всех покупок: #{total_sum}"
