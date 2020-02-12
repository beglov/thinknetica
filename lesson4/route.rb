# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'
require_relative 'acсessors'
require_relative 'station'

class Route
  extend Acсessors
  include InstanceCounter
  include Validation

  attr_reader :stations

  attr_accessor_with_history :a, :b

  strong_attr_accessor :start_station, Station
  strong_attr_accessor :end_station, Station

  validate :start_station, :presence
  validate :end_station, :presence

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
end
