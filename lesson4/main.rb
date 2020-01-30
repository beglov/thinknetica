require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railway'
require_relative 'help_methods'

railway = Railway.new
railway.seed

loop do
  puts 'Укажите что ходите сделать:'
  puts 'Введите 1 что бы создать станцию'
  puts 'Введите 2 что бы создать поезд'
  puts 'Введите 3 что бы создать маршрут или управлять станциями в нем (добавлять, удалять)'
  puts 'Введите 4 что бы назначать маршрут поезду'
  puts 'Введите 5 что бы добавить вагоны к поезду'
  puts 'Введите 6 что бы отцепить вагоны от поезда'
  puts 'Введите 7 что бы перемещать поезд по маршруту вперед и назад'
  puts 'Введите 8 что бы просматривать список станций и список поездов на станции'
  puts 'Введите 9 для выхода из программы'

  choice = gets.chomp.to_i

  if (1..9).include?(choice)
    case choice
    when 1 # Введите 1 что бы создать станцию
      create_station(railway)
    when 2 # Введите 2 что бы создать поезд
      create_train(railway)
    when 3 # Введите 3 что бы создать маршрут или управлять станциями в нем (добавлять, удалять)
      create_and_manage_routes(railway)
    when 4 # Введите 4 что бы назначать маршрут поезду
      train = railway.select_train
      route = railway.select_route
      train.assign_route(route)
    when 5 # Введите 5 что бы добавить вагоны к поезду
      train = railway.select_train
      train.add_wagon
    when 6 # Введите 6 что бы отцепить вагоны от поезда
      train = railway.select_train
      train.delete_wagon
    when 7 # Введите 7 что бы перемещать поезд по маршруту вперед и назад
      move_train(railway)
    when 8 # Введите 8 что бы просматривать список станций и список поездов на станции
      show_stations_and_trains(railway)
    when 9 # Введите 9 для выхода из программы
      break
    end
  else
    puts 'Такой команды нет. Введите корректное значение!'
  end
end
