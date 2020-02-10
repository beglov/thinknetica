# frozen_string_literal: true

require_relative 'wagon'
require_relative 'validatable'

class CargoWagon < Wagon
  include Validatable

  attr_reader :total_volume, :occupied_volume

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

  private

  def validate!
    raise ArgumentError, 'Укажите общий объем' if total_volume.nil?
    raise ArgumentError, 'Объем не может быть меньше одного' if total_volume < 1
  end
end
