class CargoTrain < Train
  def initialize(no)
    super(no, :cargo)
  end

  def add_wagon
    super(CargoWagon.new)
  end
end
