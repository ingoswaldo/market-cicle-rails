# frozen_string_literal: true

require 'test_helper'

module People
  class CreatorTest < ActiveSupport::TestCase
    def setup = @creator = People::Creator

    def test_does_not_initialize_creator = assert_raises(ArgumentError) { @creator.call(nil) }

    def test_creates_person_with_valid_attr = assert @creator.call(valid_person_attr).present?

    def test_creates_person_with_valid_details_attr
      person = @creator.call(valid_person_attr.merge({ detail_attributes: valid_details_attr }))
      assert person.present?
    end

    def test_does_not_create_person_with_invalid_attr = assert_not @creator.call(invalid_person_attr).valid?

    def test_does_not_create_person_with_invalid_details_attr
      person = @creator.call(valid_person_attr.merge({ detail_attributes: invalid_details_attr }))
      assert_not person.valid?
    end

    private

    def valid_person_attr = { name: 'whatever' }

    def invalid_person_attr = { name: '' }

    def valid_details_attr = { email: 'whatever@email.com' }

    def invalid_details_attr = { email: '' }
  end
end
