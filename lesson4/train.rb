class Train
  attr_reader :no, :type, :wagons, :speed, :route, :current_station

  def initialize(no, type)
    @no = no
    @type = type
    @wagons = []
    @speed = 0
  end

  def speed_up(speed = 10)
    @speed += speed
  end

  def speed_down(speed = 10)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def add_wagon(wagon)
    wagons.push(wagon) if speed == 0
  end

  def delete_wagon
    wagons.pop if speed == 0 && wagons.size > 0
  end

  def assign_route(route)
    @route = route
    self.current_station = route.stations.first
  end

  def next_station
    current_station_index = route.stations.index(current_station)
    route.stations[current_station_index + 1] if route.stations[current_station_index + 1]
  end

  def prev_station
    current_station_index = route.stations.index(current_station)
    route.stations[current_station_index - 1] if route.stations[current_station_index - 1]
  end

  def forward
    self.current_station = next_station if next_station
  end

  def back
    self.current_station = prev_station if prev_station
  end

  def type_label
    case type
    when :passenger
      'пассажирский'
    when :cargo
      'грузовой'
    else
      type
    end
  end

  def to_s
    "поезд номер #{no}, тип #{type_label}"
  end

  protected

  # делаем метод закрытым что бы небыло возможности из вне назначить произвольную станцию
  def current_station=(station)
    current_station.send_train(self) if current_station
    @current_station = station
    station.take_train(self)
  end
end
