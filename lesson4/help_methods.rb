def create_station(railway)
  puts 'Укажите имя станции:'
  name = gets.chomp.to_s
  railway.stations << Station.new(name)
end

def create_train(railway)
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
end

def create_and_manage_routes(railway)
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
end

def move_train(railway)
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
end

def show_stations_and_trains(railway)
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
end