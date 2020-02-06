class PassengerTrain < Train
  def initialize(no)
    super(no, :passenger)
  end

  def add_wagon(wagon = PassengerWagon.new)
    super
  end
end
