# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validate_methods

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
    def validate(name, type, *args)
      var_name = "@#{name}".to_sym
      method_name = "#{name}_#{type}".to_sym

      @validate_methods ||= []
      @validate_methods << method_name

      case type
      when :presence
        define_method(method_name) do
          if instance_variable_get(var_name).to_s == ''
            raise ArgumentError, "значение атрибута #{name} не может быть пустым"
          end
        end
      when :format
        define_method(method_name) do
          if instance_variable_get(var_name).to_s !~ args[0]
            raise ArgumentError, "значение атрибута #{name} имеет не верный формат"
          end
        end
      when :type
        define_method(method_name) do
          unless instance_variable_get(var_name).is_a?(args[0])
            raise TypeError, "значение атрибута #{name} имеет не верный тип"
          end
        end
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  end

  module InstanceMethods
    def validate!
      self.class.validate_methods.each do |method|
        send(method)
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end
