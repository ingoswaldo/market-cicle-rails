require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  def setup = @person = people(:one)

  def test_shows_index_page
    get people_url
    assert_response :success
  end

  def test_shows_new_page
    get new_person_url
    assert_response :success
  end

  def test_shows_person_page
    get person_url(@person)
    assert_response :success
  end

  def test_creates_person_with_valid_data
    assert_difference("Person.count") do
      post people_url, params: { person: { name: @person.name } }, as: :turbo_stream
    end

    assert_response :success
  end

  def test_does_not_create_person_with_invalid_data
    post people_url, params: { person: { name: '' } }, as: :turbo_stream

    assert_response :unprocessable_entity
  end

  def test_updates_person_with_valid_data
    assert_changes("Person.find(#{@person.id}).name") do
      put person_url(@person), params: { person: { name: 'whatever' } }, as: :turbo_stream
    end

    assert_response :success
  end

  def test_does_not_update_person_with_invalid_data
    assert_no_changes("Person.find(#{@person.id}).name") do
      put person_url(@person), params: { person: { name: '' } }, as: :turbo_stream
    end

    assert_response :unprocessable_entity
  end

  def test_destroy_person
    assert_changes("Person.count") do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
