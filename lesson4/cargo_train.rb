class CargoTrain < Train
  def initialize(no)
    super(no, :cargo)
  end

  def add_wagon(wagon = CargoWagon.new)
    super
  end
end
