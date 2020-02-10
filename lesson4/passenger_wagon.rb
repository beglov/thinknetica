# frozen_string_literal: true

require_relative 'wagon'
require_relative 'validatable'

class PassengerWagon < Wagon
  include Validatable

  attr_reader :total_seats, :occupied_seats

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

  private

  def validate!
    raise ArgumentError, 'Укажите общее кол-во мест' if total_seats.nil?
    if total_seats < 1
      raise ArgumentError, 'Общее кол-во мест не может быть меньше одного'
    end
  end
end
