class Animal
  attr_reader :name, :voice

  def initialize(name)
    @name = name
    @voice = '...'
  end

  def cry
    "#{@name}: #{@voice}"
  end
end


class Dog < Animal
  def initialize(name)
    super
    @voice = "ワンワン!"
  end
end


class Cat < Animal
  def initialize(name)
    super
    @voice = "ニャー!"
  end
end
