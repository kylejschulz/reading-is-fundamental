class Review
  attr_reader :score, :name
  def initialize(args)
    @name = args[:name]
    @score = args[:score].to_f.round(1)
  end

  def reviewer_first_name
    @name.split(' ')[0]
  end

  def reviewer_last_name
    @name.split(' ')[1]
  end

end
