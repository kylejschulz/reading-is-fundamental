require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/review'
require './lib/bookclub'

class BookClubTest < Minitest::Test
  def setup
    @bookclub = BookClub.new("2020 Books")
    @book = Book.new({title: 'Practical Object Oriented Design in Ruby', author: 'Sandi Metz'})# => #<Book:0x00007fe0d0851138...>
    @book_2 = Book.new({title: 'Harry Potter', author: 'JK rowling'})# => #<Book:0x00007fe0d0851138...>

    @review_1 = Review.new({name: "Aral Nuraduum", score: "3.5"})# => #<Review:0x00007fd8273d21e0...>
    @review_2 = Review.new({name: "Aniz Arazak", score: "5.0"})# => #<Review:0x0012fdabcd3d21e0...>
    @review_3 = Review.new({name: "Aniz Arazak", score: "3.0"})

  end

  def test_it_exists
    assert_instance_of BookClub, @bookclub
  end

  def test_it_has_attributes
    # A `BookClub` has a name.
    assert_equal "2020 Books", @bookclub.name
  end

  def test_it_can_add_books
    @bookclub.add_books(@book)

    assert_equal [@book], @bookclub.books
  end

  def test_it_can_return_read_books
    skip
    @book.add_review(@review_1)
    @book.add_review(@review_2)
    @bookclub.add_books(@book)
    @book.read = true

    assert_equal [@book], @bookclub.read_books
  end

  def test_it_can_return_unread_books
    skip
    @book.add_review(@review_1)
    @book.add_review(@review_2)
    @bookclub.add_books(@book)

    assert_equal [@book], @bookclub.unread_books
  end

  def test_it_can_return_reivew_average
    skip
    @book.add_review(@review_1)
    @book.add_review(@review_2)
    @bookclub.add_books(@book)

    assert_equal 4.3, @bookclub.average_reviews(@book)
  end


  def test_it_can_return_average_reviews_per_book
    skip
    @book.add_review(@review_1)
    @book.add_review(@review_2)
    @bookclub.add_books(@book)

    hash = {"Practical Object Oriented Design in Ruby" => 4.3}
    assert_equal hash, @bookclub.average_reviews_per_book

  end

  def test_it_can_return_authors
    skip
    @bookclub.add_books(@book)
    hash_1 = { "Sandi Metz" => [@book]}

    assert_equal hash_1, @bookclub.authors
  end

  def test_it_can_return_reviewers
    @book_2.add_review(@review_3)
    @book.add_review(@review_1)
    @book.add_review(@review_2)
    @bookclub.add_books(@book)
    @bookclub.add_books(@book_2)
    hash = {"Aral Nuraduum" => [@review_1],
            "Aniz Arazak" => [@review_2, @review_3]
          }
    assert_equal hash, @bookclub.book_reviews_by_reviewer
  end

  def test_most_prolific_reviewer
    skip 
    @book_2.add_review(@review_3)
    @book.add_review(@review_1)
    @book.add_review(@review_2)
    @bookclub.add_books(@book)
    @bookclub.add_books(@book_2)

    expected = {"Aniz Arazak" => [@review_2, @review_3]}

    assert_equal expected, @bookclub.most_prolific_reviewer
  end
end

#`#most_prolific_reviewer` is a method on `BookClub` that
#returns a hash. The key is a string with the name of the person
#who has written the most reviews, and the value is an array of
#all of their `Review` objects.
