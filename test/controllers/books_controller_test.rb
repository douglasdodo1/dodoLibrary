require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { ano_aquisicao: @book.ano_aquisicao, ano_lancamento: @book.ano_lancamento, author_id: @book.author_id, cover_image_url: @book.cover_image_url, edition: @book.edition, isbn: @book.isbn, language_id: @book.language_id, name: @book.name, pages: @book.pages, price: @book.price, publisher_id: @book.publisher_id, quantity: @book.quantity, shelf_location: @book.shelf_location, status_id: @book.status_id, summary: @book.summary } }, as: :json
    end

    assert_response :created
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { ano_aquisicao: @book.ano_aquisicao, ano_lancamento: @book.ano_lancamento, author_id: @book.author_id, cover_image_url: @book.cover_image_url, edition: @book.edition, isbn: @book.isbn, language_id: @book.language_id, name: @book.name, pages: @book.pages, price: @book.price, publisher_id: @book.publisher_id, quantity: @book.quantity, shelf_location: @book.shelf_location, status_id: @book.status_id, summary: @book.summary } }, as: :json
    assert_response :success
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end

    assert_response :no_content
  end
end
