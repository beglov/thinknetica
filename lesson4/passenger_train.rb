class PassengerTrain < Train
  def initialize(no)
    super(no, :passenger)
  end

  def add_wagon
    super(PassengerWagon.new)
  end
end
