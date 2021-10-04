# frozen_string_literal: true

require_relative 'base'
require 'json'

module Deimos
  module SchemaClass
    # Base Class of Record Classes generated from Avro.
    class Record < Base

      # Element access method as if this Object were a hash
      # @param key[String||Symbol]
      # @return [Object] The value of the attribute if exists, nil otherwise
      def [](key)
        self.try(key.to_sym)
      end

      # :nodoc
      def with_indifferent_access
        self
      end

      # Returns the schema name of the inheriting class.
      # @return [String]
      def schema
        raise NotImplementedError
      end

      # Returns the namespace for the schema of the inheriting class.
      # @return [String]
      def namespace
        raise NotImplementedError
      end

      # Returns the full schema name of the inheriting class.
      # @return [String]
      def full_schema
        "#{namespace}.#{schema}"
      end

      # Returns the schema validator from the schema backend
      # @return [Deimos::SchemaBackends::Base]
      def validator
        Deimos.schema_backend(schema: schema, namespace: namespace)
      end

      # @return [Array<String>] an array of fields names in the schema.
      def schema_fields
        validator.schema_fields.map(&:name)
      end
    end
  end
end
