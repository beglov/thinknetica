# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validate_params

    def validate(name, type, *args)
      @validate_params ||= []
      @validate_params << [name, type, *args]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validate_params.each do |validate_param|
        name, type, *args = validate_param
        send("validate_#{type}", name, *args)
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate_presence(name, *_args)
      return unless instance_variable_get("@#{name}".to_sym).to_s == ''

      raise ArgumentError, "значение атрибута #{name} не может быть пустым"
    end

    def validate_format(name, *args)
      return unless instance_variable_get("@#{name}".to_sym).to_s !~ args[0]

      raise ArgumentError, "значение атрибута #{name} имеет не верный формат"
    end

    def validate_type(name, *args)
      return if instance_variable_get("@#{name}".to_sym).is_a?(args[0])

      raise ArgumentError, "значение атрибута #{name} имеет не верный тип"
    end
  end
end
