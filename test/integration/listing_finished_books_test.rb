require 'test_helper'

class ListingFinishedBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'finished', finished_at: 1.day.ago)
    Book.create!(title: 'Not finished', finished_at: nil)
  end

  test 'lists finished books in json' do
    get '/finished_books', as: :json
    assert_equal 200, response.status
    assert_equal 1, json(response.body).size
  end

  test 'lists finished books in xml' do
    get '/finished_books.xml'
    assert_equal 200, response.status
    assert_equal 1, Hash.from_xml(response.body)['books'].size
  end
end
