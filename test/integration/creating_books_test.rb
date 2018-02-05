require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
  test 'create new books with valid data' do
    post '/books', params: { book: { title: 'Livro do Danilo', rating: 5 } }
    assert_equal 201, response.status
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location
    assert_equal 'Livro do Danilo', book[:title]
  end

  test 'does not create books with invalid data' do
    post '/books', params: { book: { title: nil, rating: 5 } }
    assert_equal 422, response.status
  end
end
