class BookClub
  attr_reader :name, :books
  def initialize(name)
    @name = name
    @books = []
  end

  def add_books(book)
    @books << book
  end

end
