# frozen_string_literal: true

class CargoTrain < Train
  def initialize(number)
    super(number, :cargo)
  end

  def add_wagon(wagon = CargoWagon.new)
    super
  end
end
