# frozen_string_literal: true

require_relative 'wagon'
require_relative 'validation'

class PassengerWagon < Wagon
  include Validation

  attr_reader :total_seats, :occupied_seats

  validate :total_seats, :presence
  validate :total_seats, :type, Integer

  def initialize(total_seats = 30)
    @total_seats = total_seats
    @occupied_seats = 0
    validate!
  end

  def take_seat
    @occupied_seats += 1 if occupied_seats < total_seats
  end

  def free_seats
    total_seats - occupied_seats
  end
end
