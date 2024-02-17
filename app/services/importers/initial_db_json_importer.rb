# frozen_string_literal: true

require 'json'

module Importers
  class InitialDbJsonImporter < ApplicationService
    def initialize = @json_data = get_json_data

    def call
      transform_json_data_keys
      @json_data.each { |attributes| People::Creator.call(attributes) }
    end

    private

    def transform_json_data_keys
      @json_data.map! do |element|
        element['details_attributes'] = [element.delete('info')]
        element
      end
    end

    def get_json_data = JSON.parse(read_initial_db_json_file)

    def read_initial_db_json_file
      file_path = Rails.root.join('db', 'import', 'initial-data.json')
      File.read(file_path)
    end
  end
end
