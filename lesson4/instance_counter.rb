module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @count_instances
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instance_variable_set(:@count_instances, self.class.instance_variable_get(:@count_instances).to_i + 1)
    end
  end
end
