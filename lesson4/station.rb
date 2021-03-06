# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

# rubocop:disable Style/ClassVars
class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :trains

  validate :name, :presence
  validate :name, :type, String
  validate :name, :format, /[\d\w]+/

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

  def each_train
    trains.each { |train| yield(train) } if block_given?
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
end
# rubocop:enable Style/ClassVars
