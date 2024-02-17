# frozen_string_literal: true

module People
  class Creator < ApplicationService
    def initialize(attributes)
      raise ArgumentError, 'Attributes must be provided' if attributes.nil?

      @attributes = attributes
    end

    def call = Person.create(@attributes)
  end
end
