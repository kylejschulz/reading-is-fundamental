require 'minitest/autorun'
require 'minitest/pride'
require './lib/review'

class ReviewTest < Minitest::Test
  def setup
    @review = Review.new({name: "Aral Nuraduum", score: "4.5"}) # => #<Review:0x00007fd8273d21e0...>

  end

  def test_it_exists

    assert_instance_of Review, @review
  end

  def test_it_has_attributes

    assert_equal "Aral", @review.reviewer_first_name
    assert_equal "Nuraduum", @review.reviewer_last_name # => "Nuraduum"
    assert_equal 4.5, @review.score # => 4.5
  end

  def test_it_can_have_different_attributes
  end
end
