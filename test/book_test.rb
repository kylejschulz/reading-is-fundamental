require 'minitest/autorun'
require 'minitest/pride'
require './lib/review'
require './lib/book'

class BookTest < Minitest::Test
  def setup
    @book = Book.new({title: 'Practical Object Oriented Design in Ruby', author: 'Sandi Metz'})# => #<Book:0x00007fe0d0851138...>
    @review_1 = Review.new({name: "Aral Nuraduum", score: "3.5"})# => #<Review:0x00007fd8273d21e0...>
    @review_2 = Review.new({name: "Aniz Arazak", score: "5.0"})# => #<Review:0x0012fdabcd3d21e0...>
  end

  def test_it_exists
  assert_instance_of Book, @book
  end

  def test_it_has_attributes
    assert_equal 'Practical Object Oriented Design in Ruby', @book.title# =>
    assert_equal 'Sandi Metz', @book.author# => 'Sandi Metz'
  end

  def test_it_can_have_different_attributes
    assert_equal false, @book.read?# => false

    @book.read = true

    assert_equal true, @book.read?# => true
  end

  def test_it_can_have_reviews
    @book.add_review(@review_1)
    @book.add_review(@review_2)

    assert_equal [@review_1, @review_2], @book.reviews
  end

  def test_for_reviews_over_X
    @book.add_review(@review_1)
    @book.add_review(@review_2)

    assert_equal [@review_1, @review_2], @book.reviews_greater_than(3)
    assert_equal [@review_2], @book.reviews_greater_than(4)
  end
end
