# frozen_string_literal: true

require_relative 'wagon'
require_relative 'validation'

class CargoWagon < Wagon
  include Validation

  attr_reader :total_volume, :occupied_volume

  validate :total_volume, :presence
  validate :total_volume, :type, Numeric

  def initialize(total_volume = 100)
    @total_volume = total_volume
    @occupied_volume = 0
    validate!
  end

  def take_volume(volume)
    @occupied_volume += volume if occupied_volume + volume <= total_volume
  end

  def free_volume
    total_volume - occupied_volume
  end
end
