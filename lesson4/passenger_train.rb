# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number)
    super(number, :passenger)
  end

  def add_wagon(wagon = PassengerWagon.new)
    super
  end
end
