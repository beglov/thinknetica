class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    puts "Поезд номер #{train.no} прибыл на станцию #{name}"
    trains << train
  end

  def send_train(train)
    puts "Поезд номер #{train.no} отбыл со станции #{name}"
    trains.delete(train)
  end

  def trains_by_type(type = nil)
    if type
      trains.select { |i| i.type == type }
    else
      trains
    end
  end

  def to_s
    name
  end
end
