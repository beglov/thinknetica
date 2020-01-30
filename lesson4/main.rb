require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'railway'

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
      puts 'Укажите имя станции:'
      name = gets.chomp.to_s
      railway.stations << Station.new(name)
    when 2 # Введите 2 что бы создать поезд
      puts 'Введите номер поезда:'
      no = gets.chomp.to_s

      action = 0
      until [1, 2].include?(action)
        puts 'Какой поезд создать?'
        puts '1 - грузовой'
        puts '2 - пассажирский'

        action = gets.chomp.to_i
      end

      railway.trains << (action == 1 ? CargoTrain.new(no) : PassengerTrain.new(no))
    when 3 # Введите 3 что бы создать маршрут или управлять станциями в нем (добавлять, удалять)
      action = railway.routes.empty? ? 1 : 0

      if action.zero?
        until [1, 2].include?(action)
          puts "Введеите 1 что бы создать новый маршрут"
          puts "Введеите 2 что бы отредактировать существующий маршрут"
          action = gets.chomp.to_i
        end
      end

      case action
      when 1
        start_station = railway.select_station('Введите порядковый номер начальной станции:')
        end_station = railway.select_station('Введите порядковый номер конечной станции:')
        railway.routes << Route.new(start_station, end_station)
      when 2
        route = railway.select_route

        action = 0
        until [1, 2].include?(action)
          puts "Введите 1 что бы добавить станцию"
          puts "Введите 2 что бы удалить станцию"
          action = gets.chomp.to_i
        end

        station = railway.select_station

        case action
        when 1
          route.add_station(station)
        when 2
          route.delete_station(station)
        end
      end
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
      train = railway.select_train

      action = 0
      until [1, 2].include?(action)
        puts "Введеите 1 что бы переместить поезд вперед"
        puts "Введеите 2 что бы переместить поезд назад"
        action = gets.chomp.to_i
      end

      case action
      when 1
        train.forward
      when 2
        train.back
      end
    when 8 # Введите 8 что бы просматривать список станций и список поездов на станции
      puts "Список станций:"
      railway.stations.each do |station|
        puts "Станция '#{station}'"
        if station.trains.empty?
          puts "Поездов на станции нет."
        else
          puts "Поезда на ней в данный момент:"
          puts station.trains
        end
      end
    when 9 # Введите 9 для выхода из программы
      break
    end
  else
    puts 'Такой команды нет. Введите корректное значение!'
  end
end
