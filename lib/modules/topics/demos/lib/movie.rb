class Movie
  # Mixin Comparable assumes any class using it defines
  # operator <=> and adds comparison operators and between? methods
  # Reference: Page 90 of Programming Ruby textbook
  include Comparable
  attr_reader :title, :description

  def initialize(title, description)
    @title = title
    @description = description
  end

  def to_s
    "#{@title}"
  end

  def <=>(other)
    @title <=> other.title
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end
end