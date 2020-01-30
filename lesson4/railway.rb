class Railway
  attr_accessor :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def select_station(message = 'Введите порядковый номер станции:')
    station = nil

    until station
      puts message
      puts stations
      station_index = gets.chomp.to_i - 1
      station = stations[station_index]
    end

    station
  end

  def select_route(message = 'Введите порядковый номер маршрута:')
    route = nil

    until route
      puts message
      puts routes
      route_index = gets.chomp.to_i - 1
      route = routes[route_index]
    end

    route
  end

  def select_train(message = 'Введите порядковый номер поезда:')
    train = nil

    until train
      puts message
      puts trains
      train_index = gets.chomp.to_i - 1
      train = trains[train_index]
    end

    train
  end

  def seed
    station1 = Station.new('Ожерелье')
    station2 = Station.new('Москва')
    station3 = Station.new('Кашира')
    station4 = Station.new('Ступино')
    station5 = Station.new('Ситенка')

    self.stations = [
        station1,
        station2,
        station3,
        station4,
        station5,
    ]

    route = Route.new(station1, station2)
    route.add_station(station3)
    route.add_station(station4)
    route.add_station(station5)

    self.routes = [route]

    self.trains = [
        PassengerTrain.new('123'),
        PassengerTrain.new('345'),
        CargoTrain.new('qwerty'),
    ]
  end

  def clear
    self.stations = []
    self.routes = []
    self.trains = []
  end
end
