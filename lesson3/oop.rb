class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    puts "Поезд номер #{train.no} прибыл на станцию #{name}"
    trains << train
  end

  def send_train(train)
    puts "Поезд номер #{train.no} отбыл со станции #{name}"
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |i| i.type == type }
  end
end

class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def show_route
    puts stations.map(&:name).join(' => ')
  end
end

class Train
  attr_reader :no, :type, :cnt_carriage, :speed, :route, :current_station

  def initialize(no, type, cnt_carriage)
    @no = no
    @type = type
    @cnt_carriage = cnt_carriage
    @speed = 0
  end

  def speed_up(speed = 10)
    @speed += speed
  end

  def speed_down(speed = 10)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def cnt_carriage_up
    @cnt_carriage += 1 if speed == 0
  end

  def cnt_carriage_down
    @cnt_carriage -= 1 if speed == 0
  end

  def current_station=(station)
    current_station.send_train(self) if current_station
    @current_station = station
    station.take_train(self)
  end

  def assign_route(route)
    @route = route
    self.current_station = route.stations.first
  end

  def next_station
    current_station_index = route.stations.index(current_station)
    route.stations[current_station_index + 1]
  end

  def prev_station
    current_station_index = route.stations.index(current_station)
    route.stations[current_station_index - 1]
  end

  def forward
    self.current_station = next_station
  end

  def back
    self.current_station = prev_station
  end
end

st1 = Station.new('Ожерелье')
st2 = Station.new('Москва')
st3 = Station.new('Кашира')
st4 = Station.new('Ступино')
st5 = Station.new('Ситенка')

rt = Route.new(st1, st2)
rt.add_station(st3)
rt.add_station(st4)
rt.add_station(st5)
rt.show_route
rt.delete_station(st3)
rt.show_route
rt.stations

train1 = Train.new('123', 'грузовой', 10)
train2 = Train.new('456', 'пассажирский', 15)

train1.speed_up
train1.speed_up(20)
train1.speed
train1.speed_down(5)
train1.speed

train1.cnt_carriage
train1.cnt_carriage_up
train1.cnt_carriage
train1.speed_down(25)
train1.cnt_carriage_up
train1.cnt_carriage

train1.current_station
train1.assign_route(rt)
train2.assign_route(rt)
train1.current_station

train1.forward
train1.next_station
train1.prev_station
