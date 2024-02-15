require "test_helper"

class DetailTest < ActiveSupport::TestCase
  def setup = @subject = Detail.new(email: 'whatever@email.com', person: people(:one))

  def test_belongs_to_person = assert_respond_to(@subject, :person)

  def test_requires_email
    @subject.email = ''
    assert_not @subject.valid?
  end

  def test_validates_email
    @subject.email = 'whatever'
    assert_not @subject.valid?
  end

  def test_validates_age
    @subject.age = 'string'
    assert_not @subject.valid?
  end

  def test_validates_phone
    @subject.phone = '123456789'
    assert_not @subject.valid?
  end

  def test_saves_detail_with_valid_attributes = assert @subject.save
end
