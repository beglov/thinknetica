# frozen_string_literal: true

require_relative 'manufacturer_mixin'
require_relative 'instance_counter'
require_relative 'validatable'

# rubocop:disable Style/ClassVars
class Train
  include ManufacturerMixin
  include InstanceCounter
  include Validatable

  attr_reader :no, :type, :wagons, :speed, :route, :current_station

  NUMBER_FORMAT = /^[\w\d]{3}-?[\w\d]{2}$/i.freeze

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @no = number
    @@trains[number] = self
    @type = type
    @wagons = []
    @speed = 0
    validate!
    register_instance
  end

  def each_wagon
    wagons.each { |wagon| yield(wagon) } if block_given?
  end

  def speed_up(speed = 10)
    @speed += speed
  end

  def speed_down(speed = 10)
    @speed -= speed
    @speed = 0 if @speed.negative?
  end

  def add_wagon(wagon)
    wagons.push(wagon) if speed.zero?
  end

  def delete_wagon
    wagons.pop if speed.zero? && !wagons.empty?
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

  def validate!
    raise ArgumentError, 'Укажите номер поезда' if no.nil?
    raise ArgumentError, 'Укажите тип' if type.nil?
    raise ArgumentError, 'У номера не верный формат' if no !~ NUMBER_FORMAT
  end

  # делаем метод закрытым что бы небыло возможности из вне назначить произвольную станцию
  def current_station=(station)
    current_station&.send_train(self)
    @current_station = station
    station.take_train(self)
  end
end
# rubocop:enable Style/ClassVars
