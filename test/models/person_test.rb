require "test_helper"

class PersonTest < ActiveSupport::TestCase
  def setup = @subject = Person.new(name: 'whatever')

  def test_has_many_details = assert_respond_to(@subject, :details)

  def test_requires_name
    @subject.name = ''
    assert_not @subject.valid?
  end

  def test_requires_email_if_detail_is_nested
    @subject.details_attributes = [{ email: '' }]
    assert_not @subject.valid?
  end

  def test_saves_person_with_valid_attributes = assert @subject.save
end
