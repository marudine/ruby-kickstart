# This problem is based off of example 2
# Modify it so that it also tracks a person's age and a quote
# Allow any of these to be set with a hash as well, but the block should overwrite the hash
#
#
# EXAMPLE:
#
# artist = Person.new :name => 'Prince' do |person|
#   person.age   = 47
#   person.quote = "Why don't you purify yourself in the waters of Lake Minnetonka?"
# end
#
# artist.name   # => "Prince"
# artist.age    # => 47
#
# artist.name = 'The Artist Formarly Known As Prince'
# artist.age  = 1999
#
# artist.name   # => "The Artist Formarly Known As Prince"
# artist.age    # => 1999
#
# artist.reinit
#
# artist.name   # => "The Artist Formarly Known As Prince"
# artist.age    # => 47


class Person

  def initialize(*add, &initializer)
    @initializer = initializer
    initializer.call self
    @add = add
  end

  @@add = {}

  def quote
    @@add[:quote]
  end

  def age
    @@add[:age]
  end

  def name
    @@add[:name]
  end

  def reinit
    @initializer.call self
  end

  attr_accessor :name, :age, :quote

end
