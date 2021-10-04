# frozen_string_literal: true

# This file is autogenerated by Deimos, Modify at your own risk
module Deimos
  # :nodoc:
  class MyNestedRecord < SchemaClass::Record

    # @param value [Integer]
    attr_accessor :some_int
    # @param value [Float]
    attr_accessor :some_float
    # @param value [String]
    attr_accessor :some_string
    # @param value [nil, Integer]
    attr_accessor :some_optional_int
    # @return [Object] An optional payload key
    attr_accessor :payload_key

    # @override
    def initialize(some_int:, some_float:, some_string:, some_optional_int:, payload_key: nil)
      super()
      self.some_int = some_int
      self.some_float = some_float
      self.some_string = some_string
      self.some_optional_int = some_optional_int
      self.payload_key = payload_key
    end

    # @override
    def schema
      'MyNestedRecord'
    end

    # @override
    def namespace
      'com.my-namespace'
    end

    # @override
    def to_h
      payload = {
        'some_int' => @some_int,
        'some_float' => @some_float,
        'some_string' => @some_string,
        'some_optional_int' => @some_optional_int
      }
      @payload_key.present? ? payload.merge('payload_key' => @payload_key) : payload
    end
  end
end
