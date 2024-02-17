# frozen_string_literal: true

require 'test_helper'
require 'minitest/autorun'

module Importers
  class InitialDbJsonImporterTest < Minitest::Test
    def setup = @importer = Importers::InitialDbJsonImporter

    def test_creates_person_for_each_element_in_json_data
      num_people = count_people
      file_stub(valid_data.to_json) do
        @importer.call
        assert_equal count_people, num_people + 1
      end
    end

    def test_does_not_create_person_for_each_element_in_json_data
      num_people = count_people
      file_stub(invalid_data.to_json) do
        @importer.call
        assert_equal count_people, num_people
      end
    end

    private

    def file_stub(json_data, &block)
      File.stub(:read, json_data) do
        yield(block)
      end
    end

    def count_people = Person.count

    def valid_data = [{ name: 'whatever', info: { email: 'import-1@email.com' }}]

    def invalid_data = [{ name: '', info: { email: '' }}]
  end
end
