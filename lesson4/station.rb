require_relative 'instance_counter'
require_relative 'validatable'

class Station
  include InstanceCounter
  include Validatable

  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    validate!
    register_instance
  end

  def take_train(train)
    puts "Поезд номер #{train.no} прибыл на станцию #{name}"
    trains << train
  end

  def send_train(train)
    puts "Поезд номер #{train.no} отбыл со станции #{name}"
    trains.delete(train)
  end

  def trains_by_type(type = nil)
    if type
      trains.select { |i| i.type == type }
    else
      trains
    end
  end

  def to_s
    name
  end

  private

  def validate!
    raise "Укажите название станции" if name.nil?
    raise "Название станции должно содержать как минимук один символ" if name.length < 1
  end
end
