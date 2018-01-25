require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'PraProg Book', rating: 5)
    Book.create!(title: 'Gaming Book', rating: 5)
  end

  test 'listing books' do
    get '/books'
    assert_equal 200, response.status

    assert_equal Book.count, JSON.parse(response.body).size
  end
end
