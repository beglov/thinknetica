h = {}
total_sum = 0

loop do
  puts 'Введите название товара или "стоп" для окончания ввода'
  name = gets.chomp
  break if name == 'стоп'

  puts 'Введите цену за единицу'
  price = gets.chomp.to_f

  puts 'Введите кол-во купленного товара'
  cnt = gets.chomp.to_f

  sum = price * cnt
  total_sum += sum
  h[name] = {price: price, cnt: cnt, sum: sum}
end

puts h
puts "Итоговая сумма всех покупок: #{total_sum}"