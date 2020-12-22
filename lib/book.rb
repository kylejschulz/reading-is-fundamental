class Book
  attr_reader :title, :author, :reviews
  attr_accessor :read
  def initialize(args)
    @title = args[:title]
    @author =  args[:author]
    @read = false
    @reviews = []
  end

  def read?
    @read
  end

  def add_review(review)
    @reviews << review
  end

  def reviews_greater_than(num)
    reviews_over = @reviews.find_all do |review|
      review.score > num
    end
    reviews_over
  end
end
