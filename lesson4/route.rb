require_relative 'instance_counter'
require_relative 'validatable'

class Route
  include InstanceCounter
  include Validatable

  attr_reader :stations, :start_station, :end_station

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [@start_station, @end_station]
    validate!
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def to_s
    stations.map(&:name).join(' => ')
  end

  private

  def validate!
    raise ArgumentError, 'Укажите начальную станцию' if start_station.nil?
    raise ArgumentError, 'Укажите конечную станцию' if end_station.nil?
  end
end
