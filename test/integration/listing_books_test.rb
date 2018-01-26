require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'PraProg Book', rating: 5)
    Book.create!(title: 'Gaming Book', rating: 4)
  end

  test 'listing books' do
    get '/books'
    assert_equal 200, response.status

    assert_equal Book.count, json(response.body).size
  end

  test 'lists top rated books' do
    get '/books?rating=5'
    
    assert_equal 200, response.status

    assert_equal 1, json(response.body).size
  end
end
