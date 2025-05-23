require "test_helper"

class BookGenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_genre = book_genres(:one)
  end

  test "should get index" do
    get book_genres_url, as: :json
    assert_response :success
  end

  test "should create book_genre" do
    assert_difference("BookGenre.count") do
      post book_genres_url, params: { book_genre: { book_id: @book_genre.book_id, genre_id: @book_genre.genre_id } }, as: :json
    end

    assert_response :created
  end

  test "should show book_genre" do
    get book_genre_url(@book_genre), as: :json
    assert_response :success
  end

  test "should update book_genre" do
    patch book_genre_url(@book_genre), params: { book_genre: { book_id: @book_genre.book_id, genre_id: @book_genre.genre_id } }, as: :json
    assert_response :success
  end

  test "should destroy book_genre" do
    assert_difference("BookGenre.count", -1) do
      delete book_genre_url(@book_genre), as: :json
    end

    assert_response :no_content
  end
end
